import 'package:flutter/material.dart';

class Parcel {
  final String orderDate;
  final String recipientLocation;
  final String information;
  final String parcelDimensions;
  final String productUrl;

  Parcel({
    required this.orderDate,
    required this.recipientLocation,
    required this.information,
    required this.parcelDimensions,
    required this.productUrl,
  });
}

class ParcelCard extends StatelessWidget {
  final Parcel parcel;

  ParcelCard({required this.parcel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text('Date Order: ${parcel.orderDate}'),
          Text('Recipient Location: ${parcel.recipientLocation}'),
          TextField(
            controller: TextEditingController(text: parcel.information),
          ),
          Text('Parcel Dimensions: ${parcel.parcelDimensions}'),
          Image.asset(
            'assets/images/bagage.png',
            width: 153,
            height: 153,
          ),
        ],
      ),
    );
  }
}

class Order {
  final String product;
  final DateTime orderDate;
  final DateTime arrivalDate;
  final String traveler;
  final String status;
  final String deliveryPersonName;
  final String deliveryPersonPhotoUrl;
  final IconData productIcon;

  Order({
    required this.product,
    required this.orderDate,
    required this.arrivalDate,
    required this.traveler,
    required this.status,
    required this.deliveryPersonName,
    required this.deliveryPersonPhotoUrl,
    required this.productIcon,
  });
}

class OrderCard extends StatelessWidget {
  final Order order;

  OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(order.deliveryPersonPhotoUrl),
        ),
        title: Text(
          order.product,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ordered on ${order.orderDate}',
              style: TextStyle(color: Colors.green),
            ),
            Text(
              'Delivery expected on ${order.arrivalDate}',
              style: TextStyle(color: Colors.red),
            ),
            Text(
              'Traveler: ${order.traveler}',
              style: TextStyle(color: Colors.black),
            ),
            Row(
              children: [
                Text(
                  '${order.deliveryPersonName}',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(order.deliveryPersonPhotoUrl),
                ),
              ],
            ),
            Text(
              'Status: ${order.status}',
              style: TextStyle(
                color: order.status == 'In progress'
                    ? Colors.orange
                    : Colors.green,
              ),
            ),
          ],
        ),
        trailing: Icon(order.productIcon),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _selectedStartDate = picked;
        } else {
          _selectedEndDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 360,
            color: Colors.purple,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/carry.png',
                            width: 22,
                            height: 22,
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CARRY",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                        splashRadius: 15,
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 28),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "Send ",
                                ),
                                TextSpan(
                                  text: "Anything",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 228, 225, 60),
                                  ),
                                ),
                                TextSpan(
                                  text: "  Shop ",
                                ),
                                TextSpan(
                                  text: "Anywhere",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 228, 225, 60),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          SizedBox(width: 28),
                          Text(
                            "Looking for?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.expand_more_outlined,
                            color: Colors.white,
                            size: 22,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 28),
                          Container(
                            width: 320.0,
                            height: 48.0,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Enter Origin Location",
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(173, 207, 207, 207),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                                prefixIcon: Icon(
                                  Icons.location_searching_outlined,
                                  color: Colors.yellow,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          SizedBox(width: 28),
                          Container(
                            width: 320.0,
                            height: 48.0,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Enter Destination location",
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(173, 207, 207, 207),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                                prefixIcon: Icon(
                                  Icons.location_on_sharp,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          SizedBox(width: 28),
                          Container(
                            width: 155.0,
                            height: 45.0,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Start Date",
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(173, 207, 207, 207),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                                prefixIcon: Icon(
                                  Icons.calendar_today_sharp,
                                  color: Colors.blue,
                                  size: 22,
                                ),
                              ),
                              controller: _selectedStartDate != null
                                  ? TextEditingController(
                                      text:
                                          "${_selectedStartDate!.day}/${_selectedStartDate!.month}/${_selectedStartDate!.year}")
                                  : null,
                              onTap: () {
                                _selectDate(context, true);
                              },
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            width: 155.0,
                            height: 45.0,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "End Date",
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(173, 207, 207, 207),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                                prefixIcon: Icon(
                                  Icons.calendar_today_sharp,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              ),
                              controller: _selectedEndDate != null
                                  ? TextEditingController(
                                      text:
                                          "${_selectedEndDate!.day}/${_selectedEndDate!.month}/${_selectedEndDate!.year}")
                                  : null,
                              onTap: () {
                                _selectDate(context, false);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          SizedBox(width: 28),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 127.0, vertical: 10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            height: 72,
            color: Colors.white,
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: 11),
                  GestureDetector(
                    onTap: () {
                      // Action to be performed when the container is pressed
                    },
                    child: Container(
                      width: 183,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/icons/carton.png',
                              width: 23,
                              height: 23,
                            ),
                          ),
                          Text(
                            'Parcel request',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      // Action to be performed when the container is pressed
                    },
                    child: Container(
                      width: 180,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/icons/les-valises.png',
                              width: 23,
                              height: 23,
                            ),
                          ),
                          Text(
                            'Offer Space',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 12),
              Container(
                height: 38,
                color: Colors.white,
                child: Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Active Order",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 19, 19, 19),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
          SizedBox(height: 8),
          OrderCard(
            order: Order(
              product: 'Product 1',
              orderDate: DateTime.now(),
              arrivalDate: DateTime.now().add(Duration(days: 7)),
              traveler: 'Traveler 1',
              status: 'In progress',
              deliveryPersonName: 'Delivery Person Name 1',
              deliveryPersonPhotoUrl: 'Delivery Person Photo URL 1',
              productIcon: Icons.shopping_cart, // Product 1 Icon
            ),
          ),
          OrderCard(
            order: Order(
              product: 'Product 2',
              orderDate: DateTime.now(),
              arrivalDate: DateTime.now().add(Duration(days: 10)),
              traveler: 'Traveler 2',
              status: 'Delivered',
              deliveryPersonName: 'Delivery Person Name 2',
              deliveryPersonPhotoUrl: 'Delivery Person Photo URL 2',
              productIcon: Icons.shopping_cart, // Product 2 Icon
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 300,
            color: Colors.orange,
            child: Column(
              children: <Widget>[
                ParcelCard(
                  parcel: Parcel(
                    orderDate: 'Date Order',
                    recipientLocation: 'Recipient Location',
                    information: 'Information',
                    parcelDimensions: 'Parcel Dimensions',
                    productUrl: 'Product URL',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
