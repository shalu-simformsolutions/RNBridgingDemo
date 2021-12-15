/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {
  Image,
  LogBox,
  NativeModules,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
LogBox.ignoreAllLogs();

const App = () => {
  const {NavigateToNative, TestingEvent} = NativeModules.NativeScreen;
  const imageUrl =
    'https://s3.amazonaws.com/media-p.slid.es/uploads/alexanderfarennikov/images/1198519/reactjs.png';
    
  return (
    <View style={styles.container}>
      <Image
        style={styles.image}
        source={{
          uri: imageUrl,
        }}
      />
      <TouchableOpacity
        style={styles.button}
        onPress={() => {
          NavigateToNative(imageUrl);
        }}>
        <Text style={styles.text}>Open Native Screen! 🎉</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={styles.button}
        onPress={() => {
          TestingEvent('React native bridge testing event');
        }}>
        <Text style={styles.text}>Testing event! 🎉</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'black',
    justifyContent: 'center',
    alignItems: 'center',
  },
  button: {
    marginVertical: 24,
    backgroundColor: 'white',
    padding: 16,
    borderRadius: 12,
  },
  text: {
    color: 'black',
  },
  image: {
    width: 227,
    height: 200,
    resizeMode: 'contain',
    alignSelf: 'center',
  },
});

export default App;
