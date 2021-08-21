



import { StatusBar } from 'expo-status-bar';
import React, { Component } from 'react';
import {
  StyleSheet,
  Text,
  View,
  FlatList,
  SectionList,
  SafeAreaView,
  Image,
} from 'react-native';

const ListItem = ({ item }) => {
  return (
    <View style={styles.item}>
      <Image
        source={{
          uri: item.uri,
        }}
        style={styles.itemPhoto}
        resizeMode="cover"
      />
      <Text style={styles.itemText}>{item.text}</Text>
    </View>
  );
};


const SECTIONS = [
  {
    title: 'On Going Causes',
    data: [
      {
        key: '1',
        text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum ',
        uri: 'https://picsum.photos/id/1/200',
      },
      {
        key: '2',
        text: 'Item text 2',
        uri: 'https://picsum.photos/id/10/200',
      },

      {
        key: '3',
        text: 'Item text 3',
        uri: 'https://picsum.photos/id/1002/200',
      },
      {
        key: '4',
        text: 'Item text 4',
        uri: 'https://picsum.photos/id/1006/200',
      },
      {
        key: '5',
        text: 'Item text 5',
        uri: 'https://picsum.photos/id/1008/200',
      },
    ],
  },
  {
    title: 'Created For You that you could buy bettter things from us and can redeem you impact coin',
    data: [
      {
        key: '1',
        text: 'Item text 1',
        uri: 'https://picsum.photos/id/1011/200',
      },
      {
        key: '2',
        text: 'Item text 2',
        uri: 'https://picsum.photos/id/1012/200',
      },

      {
        key: '3',
        text: 'Item text 3',
        uri: 'https://picsum.photos/id/1013/200',
      },
      {
        key: '4',
        text: 'Item text 4',
        uri: 'https://picsum.photos/id/1015/200',
      },
      {
        key: '5',
        text: 'Item text 5',
        uri: 'https://picsum.photos/id/1016/200',
      },
    ],
  },
  {
    title: 'Limited Time Deals Limited Time Deals Limited Time Deals Limited Time Deals Limited Time Deals Limited Time Deals Limited Time Deals',
    data: [
      {
        key: '1',
        text: 'Item text 1',
        uri: 'https://picsum.photos/id/1020/200',
      },
      {
        key: '2',
        text: 'Item text 2',
        uri: 'https://picsum.photos/id/1024/200',
      },

      {
        key: '3',
        text: 'Item text 3',
        uri: 'https://picsum.photos/id/1027/200',
      },
      {
        key: '4',
        text: 'Item text 4',
        uri: 'https://picsum.photos/id/1035/200',
      },
      {
        key: '5',
        text: 'Item text 5',
        uri: 'https://picsum.photos/id/1038/200',
      },
    ],
  },
];




class StoreView extends Component {
  state = {
    count: 0
  }

  onPress = () => {
    this.setState({
      count: this.state.count + 1
    })
  }

 render() {
    return (
        <View style={styles.container}>
          <StatusBar style="light" />
          <SafeAreaView style={{ flex: 1 }}>
            <SectionList
              contentContainerStyle={{ paddingHorizontal: 10 }}
              stickySectionHeadersEnabled={false}
              sections={SECTIONS}
              renderSectionHeader={({ section }) => (
                <>
                <Text style={styles.sectionHeader}>{section.title}</Text>
                <FlatList  contentContainerStyle={{ justifyContent: 'center', flexDirection: 'row', flexWrap: 'wrap' }} data = {section.data} horizontal renderItem = {({item}) => {
                    return <ListItem item = {item}></ListItem>
                }}></FlatList>
                </>
              )}
              renderItem={({ item, section }) => {
                return null;
                return <ListItem item={item} />;
              }}
            />
          </SafeAreaView>
        </View>
      );
  }
}

const styles = StyleSheet.create({
    container: {
      flex: 1,
      flexGrow: 1,
    //   backgroundColor: '#121212',
      backgroundColor : 'rgba(255, 255, 255, 0.5)',
    },
    
    sectionHeader: {
      fontWeight: '800',
      fontSize: 18,
      marginTop: 20,
      marginBottom: 5,
    },
    item: {
      margin: 10,
      backgroundColor : 'rgba(255, 255, 255, 0.5)',
      flexDirection : 'column',
      marginVertical: 8,
      marginHorizontal: 16,
      
    },
    itemPhoto: {
      width: 200,
      height: 200,
    },
    itemText: {
      marginTop: 5,
      flex: 1, flexWrap: 'wrap'
    },
  });

export default StoreView;