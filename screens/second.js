import { StyleSheet, Text, View, TouchableOpacity, NativeModules, NativeEventEmitter, Alert, Linking } from 'react-native'
import React, { useEffect } from 'react'
import { Navigation } from "react-native-navigation";

const Second = (props) => {
  let subscription;

  console.log('Second render');

  const MyModule = new NativeEventEmitter(NativeModules.MyCustomModule)

  function Aditya() {
    console.log("Calling Aditya !");
    Alert.alert("Calling Aditya !")



    // navigation.push("Second");
  }


  useEffect(() => {

    MyModule.addListener("CallingFromiOS", res => {
      console.log("Hi MyModule.addListener", res);
      Aditya()
      // const listener = {
      //   componentDidAppear: ({ componentId }) => {
      //     console.log('Component appeared:', componentId);
      //   },
      // };

      // subscription = Navigation.events().registerComponentListener(listener);
      // Navigation.events().bindComponent(this);
    })

    return () => {
      // MyModule.removeAllListeners("CallingFromiOS")
      console.log("Second Unmount");

      subscription.remove();
    }
  }, [])


  return (


    <View style={{
      flex: 1, backgroundColor: 'blue', justifyContent: "center", alignItems: "center"
    }}>
      <Text>second</Text>
      <TouchableOpacity
        onPress={() => {
          console.log('componentId', props);
          Navigation.push("Component1", {
            component: {
              name: 'Main'
            }
          })
        }
        }
        style={{
          height: 50,
          backgroundColor: "red",
          justifyContent: "center",
          alignItems: "center",
          width: "50%",
          borderRadius: 10,
        }}
      >
        <Text
          style={{
            color: "white",
            fontSize: 18,
            fontWeight: "bold",
          }}
        >
          Navigate
        </Text>
      </TouchableOpacity>

      <TouchableOpacity
        onPress={() => navigation.replace('Second', { owner: 'Third' })}
        style={{
          height: 50,
          backgroundColor: "red",
          justifyContent: "center",
          alignItems: "center",
          width: "50%",
          borderRadius: 10,
        }}
      >
        <Text
          style={{
            color: "white",
            fontSize: 18,
            fontWeight: "bold",
          }}
        >
          replace
        </Text>
      </TouchableOpacity>

      <TouchableOpacity
        onPress={() => {
          Linking.openURL("testproject://openSecondScreen");
        }}
        style={{
          height: 50,
          backgroundColor: "red",
          justifyContent: "center",
          alignItems: "center",
          width: "50%",
          borderRadius: 10,
        }}
      >
        <Text
          style={{
            color: "white",
            fontSize: 18,
            fontWeight: "bold",
          }}
        >
          pop
        </Text>
      </TouchableOpacity>
      <TouchableOpacity
        onPress={() => {
          console.log("onPress", NativeModules);
          NativeModules.MyCustomModule.myMethod("Pratap", "products", "India")
          Linking.openURL("testproject://openScreen");
        }}
        style={{
          height: 50,
          backgroundColor: "red",
          justifyContent: "center",
          alignItems: "center",
          width: "50%",
          borderRadius: 10,
        }}
      >
        <Text
          style={{
            color: "white",
            fontSize: 18,
            fontWeight: "bold",
          }}
        >
          Call
        </Text>
      </TouchableOpacity>
    </View>
  )
}

export default Second

