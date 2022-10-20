---
title: "Logging in from an app"
date: 2021-06-20T09:20:00+01:00
type: docs
weight: 60
description: Validating logins from a third party app
tags:
- Software Architect
- v6
---
It's possible for a developer to create a third party application, for example a phone or tablet app, that communicates with Agilebase via the [API](/docs/integrations).

Now to use the API, you don't need to authenticate as a user, as long as the app has the correct Authorization key(s), it can read and write data to Agilebase.

However, in some cases the app may need to confirm that someone has a valid Agilebase account before allowing them to use the app. This may or may not be necessary depending on the use case, for example depending on whether the app is free to use for anyone, or must be limited to paying customers.

To validate a user, the app must redirect them to the Agilebase login page, let them log in and confirm that was successful. Therefore, a HTTP client is necessary - this can be a 'web view component' or a programmatic client such as the [Apache HTTP Client](https://hc.apache.org/) for [Java](https://en.wikipedia.org/wiki/Java_%28programming_language%29).

In this example, we'll use the [React](https://reactjs.org/) [Native Web View](https://www.npmjs.com/package/react-native-webview) but the principle is the same for any programming language or library.

## General Principle
The application must reproduce the same login process as a human would, using a HTTP client. Importantly, the HTTP client must support cookies, as the login process depends on them, in particular setting a `JSESSIONID` cookie.

1. Make a request to load the page https://appserver.gtportalbase.com/Agilebase/AppController.servlet?return=user_details. This will return the login page and set the cookie value.
2. Submit the login form using the user's username and password. If using a programattic process i.e. making the calls from code rather than using a web view, this means making a form POST to `/Agilebase/j_security_check` with the parameters `j_username` and `j_password`
3. Detect whether the login's successful. If not, the standard Agilebase login failure page will be returned
4. If successful, a HTML page will be returned containing three hidden input fields, `username`, `forename`, `surname` containing relevant details for the logged in user. If being called from a React Native Web View, the page will also post back messages to React using this JavaScript:
```
if (window.ReactNativeWebView) {
    window.ReactNativeWebView.postMessage("username:" + username);
    window.ReactNativeWebView.postMessage("forename:" + forename);
    window.ReactNativeWebView.postMessage("surname:" + surname);
}
```

## Example
Here's a full example of a login.js page using the React Native Web View. NB this is an example taken from a full application, so you will need to modify it / strip it back to suit your needs, before it can be run.

```
//Node imports
import React, {useEffect, useRef, useState} from 'react';
import {View, StatusBar, Image, ImageBackground, ScrollView} from 'react-native';

//Local imports
import {styles} from '../../../styles/loginStyles';
import {Images, Colors, Constants, Language} from '../../../common';
import {useNetInfo} from "@react-native-community/netinfo";
import { WebView } from 'react-native-webview';
import {useDispatch, useSelector} from 'react-redux';
import {updateUserData} from '../../../redux/actions/commonAction';
import commonFunctions from '../../../common/commonFunctions';
import SplashScreen from 'react-native-splash-screen'
const {fontSize, fontFamily, Window} = Constants;

const LoginScreen = (props) => {
    const dispatch = useDispatch();
    const {user_data} = useSelector(state => state);
    const netInfo = useNetInfo();

    useEffect(function () {
        SplashScreen.hide();
        console.log('netInfo==============', netInfo)
        if(netInfo?.isInternetReachable || netInfo?.details != null){
            checkUser();
        }
    }, [netInfo, user_data]);

    const checkUser = () => {
        if(user_data && user_data?.forename && user_data?.surname && user_data?.username){
            goToNextPage();
        }
        console.log('user_data', user_data)
    }

    const goToNextPage = async () => {
        await commonFunctions.removeTimeStamp();
        navigateToNextPage();
    }

    const onResponseFromWebView = (event) => {
        const eventData = event.nativeEvent.data;
        console.log('eventData', eventData);
        if (eventData.includes('username')) {
            dispatch(updateUserData({username: eventData.split('username:')[1]}));
        } else if (eventData.includes('forename')) {
            dispatch(updateUserData({forename: eventData.split('forename:')[1]}));
        } else if (eventData.includes('surname')) {
            dispatch(updateUserData({surname: eventData.split('surname:')[1]}));
        }
    }

    const navigateToNextPage = () => {
        if (netInfo?.isInternetReachable) {
            return props.navigation.navigate('Loading');
        }
        return props.navigation.navigate('MyApplicationPage');
    }

    return (
        <View style={styles.container}>
            <StatusBar backgroundColor={Colors.black} barStyle={'dark-content'}/>
            {(netInfo?.isInternetReachable && !user_data?.surname) ?
                <WebView
                    source={{uri: 'https://appserver.gtportalbase.com/Agilebase/AppController.servlet?return=user_details'}}
                    onMessage={onResponseFromWebView}
                    textZoom={100}
                    sharedCookiesEnabled={true}
                /> :
                <View style={styles.loadingImage}>
                    <Image source={Images.logo}/>
                </View>
            }
        </View>
    );
};

export default LoginScreen;
```

