import { StyleSheet, Text, View, TouchableOpacity } from 'react-native'
import React from 'react'

const Second = ({ navigation }) => {

  console.log('Second render');
  return (

    
    <View style={{
      flex: 1, backgroundColor: 'blue', justifyContent: "center", alignItems: "center"
    }}>
        <Text>second</Text>
      <TouchableOpacity
        onPress={() => navigation.push("Second")}
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
          replce
        </Text>
      </TouchableOpacity>

      <TouchableOpacity
        onPress={() => navigation.popToTop()}
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
    </View>
  )
}
        
        export default Second

