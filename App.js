import { StatusBar } from 'expo-status-bar';
import React, {useState,useEffect, Component} from 'react';
import { StyleSheet, Text, View, NativeModules,Platform, TouchableOpacity,DeviceEventEmitter, NativeEventEmitter, } from 'react-native';
import * as Location from 'expo-location';
import * as TaskManager from 'expo-task-manager';
// import RNLocation from 'react-native-location';
import StoreView from './StoreViewController' 
const {HomeNativeView} = NativeModules;
import SQlite from 'react-native-sqlite-storage'
const db = SQlite.openDatabase({
  name: 'LocationDB',
  location: 'default',
},
()=>{},
error => {console.log(error)}
)




export default function App() {

  const emitter = Platform.OS === 'ios' ? new NativeEventEmitter(NativeModules.ReactNativeEventEmitter) : DeviceEventEmitter
  const listener = emitter.addListener("Test", () =>
    console.log("fired test event")
  )

  

  const [location, setLocation] = useState(null);
  const [errorMsg, setErrorMsg] = useState(null);

  
  const createTable = () => {
    console.log("running db task")
    db.transaction((tc) => {
      tc.executeSql(
        "CREATE TABLE IF NOT EXISTS "
        + "Locations "
        + "(ID INTEGER PRIMARY KEY AUTOINCREMENT,Lat DOUBLE, Long DOUBLE, Accuracy DOUBLE, Timestamp DOUBLE, Speed FLOAT )"
      )
    })
  }



  TaskManager.defineTask("LocationTask", ({ data: { locations }, error }) => {
    if (error) {
      // check `error.message` for more details.
      return;
    }
    // HomeNativeView.setLocation(12123.0213123,1232.2323423,1.2)
    
    console.log('Received new locations', locations);

    
  })

  useEffect(() => {
    
    // HomeNativeView.showNativeController("native")
    // startLocation()
    
    // HomeNativeView.showNativeController("native")
    // HomeNativeView.showNativeController("native")
    (async () => {
      let { status } = await Location.requestForegroundPermissionsAsync()
      if (status !== 'granted') {
        setErrorMsg('Permission to access location was denied');
        return;
      }

      

      let location = await Location.startLocationUpdatesAsync("LocationTask",{
          accuracy: Location.Accuracy.BestForNavigationcd
       })
      
      console.log("LocatioPOint", location)
      setLocation(location);
      
      

      
    })();

    // HomeNativeView.callbackFunction(10,(ids)=>{
    //   console.log("ids",ids)
    // })

    // HomeNativeView.showNativeController("native")
  },[])

  // useEffect(()=>{
   

  // },[])

  const setData = async () => {
    await db.transaction(async tx => {
     await tx.executeSql('INSERT INTO Locations (Lat,Long,Accuracy,Timestamp,Speed) values (?, ?,?,?,?)', [location.coords.latitude,location.coords.longitude,location.coords.accuracy,location.coords.timestamp, location.coords.speed ],
        (txObj, resultSet) => console.log(resultSet),
        (txObj, error) => console.log('Error', error))
    })
  } 

  const loadNativeView = () => {
     if (Platform.OS == "ios" ){

      HomeNativeView.getName(function(result) {
        var hwAnswer = "swiftCB: " + result;
        console.log(hwAnswer);
        return hwAnswer;
     })
      HomeNativeView.showNativeController("native")
      
       // NativeHomeView.showNativeController("Native",50.0)
     } else if(Platform.OS == "android"){
       console.log("Pressed from android!!")

       var OpenActivity=NativeModules.OpenActivity

       OpenActivity.open();
     }
  }

  return (
    <View style={styles.container}>
      <TouchableOpacity onPress = {()=> {
        loadNativeView()
      }}><Text style={styles.txtStyle}>Press Me</Text></TouchableOpacity>
      <StatusBar style="auto" />
      {<StoreView/> }
     
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  flatList: {
    flex: 1,
    backgroundColor: '#fff',
  },
  txtStyle:{
    height: 20,
    width:120,
    marginTop: 100,
  }
});
