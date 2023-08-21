/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React, { useState, useEffect } from 'react';

// import type { Node } from 'react';

import {
  Button,
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  useColorScheme,
  View,
  TouchableOpacity, Linking
} from 'react-native';

import { NativeModules } from 'react-native';
// import RNHorizontalListPicker from 'rn-horizontal-list-picker';

import ValuePicker from "rn-value-picker";
// import HorizontalPicker from "react-native-horizontal-picker-2";
// import Navigation from './Navigation';
import Main from './screens/Main';
import Second from './screens/second';
import { Navigation } from "react-native-navigation";




const App = () => {


  useEffect(() => {
    const handleDeepLink = async (url) => {
      console.log("Connecting", url);

      Navigation.push("Component1", {
        component: {
          name: 'Main'
        }
      })

    };

    // Listen for incoming deep links
    Linking.addEventListener('url', handleDeepLink);

    // Check for an initial deep link when the app starts
    Linking.getInitialURL().then((url) => {
      if (url) {
        console.log("Connecting", url);
        handleDeepLink(url);
      }
      else {
        console.log("Connecting", url);
      }
    });

    // Clean up the listener when the component unmounts
    return () => {
      Linking.removeEventListener('url', handleDeepLink);
    };
  }, []);



  return (

    // <Navigation/>
    // <Main/>
    <Second />

  );
};

const styles = StyleSheet.create({
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
  },
  highlight: {
    fontWeight: '700',
  },
});

export default App;
