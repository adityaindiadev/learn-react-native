/**
 * @format
 */

// import {AppRegistry} from 'reactnative';
import { Navigation,  } from "react-native-navigation";
import App from './App';
import Second from "./screens/second";
import Third from './screens/third';
import Main from "./screens/Main";
// import {name as appName} from './app.json';
// import { Navigation } from "reactnativenavigation";


// AppRegistry.registerComponent(appName, () => App);

Navigation.registerComponent('Test_Project', () => App);
Navigation.registerComponent('Second', () => Second);
Navigation.registerComponent('Third', () => Third);
Navigation.registerComponent('Main', () => Main);
Navigation.events().registerAppLaunchedListener(() => {
   Navigation.setRoot({
     root: {
       stack: {
         children: [
           {
             component: {
               name: 'Test_Project',
               options: {
                topBar: {
                  visible: false
                }
               }
             },
           },
         ],
       },
     },
  });
});
