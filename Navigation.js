import React, { useState } from 'react';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import Main from './screens/Main';
import Second from './screens/second';
import Third from './screens/third';
import { NavigationContainer } from '@react-navigation/native';

const Stack = createNativeStackNavigator();


export default function Navigation() {
    return (
        <NavigationContainer>
            <Stack.Navigator
                initialRouteName="Main"
                screenOptions={{
                    headerTintColor: 'white',
                    headerStyle: { backgroundColor: 'tomato' },
                }}
            >
                <Stack.Screen
                    name="Main"
                    component={Main}
                    options={{
                        title: 'Awesome app',
                    }}
                />
                <Stack.Screen
                    name="Second"
                    component={Second}
                    options={{
                        title: 'My profile',
                    }}
                />
                <Stack.Screen
                    name="Third"
                    component={Third}
                    options={{
                        gestureEnabled: false,
                    }}
                />
            </Stack.Navigator>
        </NavigationContainer>
    );
}