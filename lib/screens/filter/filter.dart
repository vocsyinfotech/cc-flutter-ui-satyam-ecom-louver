import 'package:flutter/material.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

// ignore: use_key_in_widget_constructors
class Filter extends StatefulWidget {
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _watches = false;
  bool _collection = false;
  bool _outique = false;
  bool _limited = false;
  bool _expensive = false;
  bool _classical = false;
  bool _price = false;
  bool _popularity = false;
  bool _soteria = false;
  bool _vase = false;
  bool _selling = false;
  bool _rating = false;
  bool _archeological = false;
  double _starValue = 10;
  double _endValue = 80;

  Widget _buildSwitchListTile(
    String title,
    bool val,
    updatevalue,
  ) {
    return FilterChip(
      showCheckmark: false,
      selected: val,
      checkmarkColor: skin1,
      selectedColor: skin1,
      disabledColor: gray4,
      label: Text(title),
      onSelected: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text("FILTER & SORT"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            sizevertical(height: 40.0),
            Styles.regular("Select categories",
                fs: 20, ff: "AvenirMedium", al: TextAlign.left),
            sizevertical(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSwitchListTile("All Watches", _watches, (val) {
                  setState(() {
                    _watches = val;
                  });
                }),
                _buildSwitchListTile("Collection", _collection, (val) {
                  setState(() {
                    _collection = val;
                  });
                }),
                _buildSwitchListTile("Boutique", _outique, (val) {
                  setState(() {
                    _outique = val;
                  });
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSwitchListTile(" Limited", _limited, (val) {
                  setState(() {
                    _limited = val;
                  });
                }),
                _buildSwitchListTile("Expensive", _expensive, (val) {
                  setState(() {
                    _expensive = val;
                  });
                }),
                _buildSwitchListTile("Classical", _classical, (val) {
                  setState(() {
                    _classical = val;
                  });
                }),
              ],
            ),
            sizevertical(height: 40.0),
            Styles.regular("Select categories",
                fs: 20, ff: "AvenirMedium", al: TextAlign.left),
            sizevertical(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSwitchListTile("Price", _price, (val) {
                  setState(() {
                    _price = val;
                  });
                }),
                _buildSwitchListTile("Popularity", _popularity, (val) {
                  setState(() {
                    _popularity = val;
                  });
                }),
                _buildSwitchListTile("Soteria", _soteria, (val) {
                  setState(() {
                    _soteria = val;
                  });
                }),
                _buildSwitchListTile("Vase", _vase, (val) {
                  setState(() {
                    _vase = val;
                  });
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSwitchListTile(" Top Selling", _selling, (val) {
                  setState(() {
                    _selling = val;
                  });
                }),
                _buildSwitchListTile("Rating", _rating, (val) {
                  setState(() {
                    _rating = val;
                  });
                }),
                _buildSwitchListTile("Archeological", _archeological, (val) {
                  setState(() {
                    _archeological = val;
                  });
                }),
              ],
            ),
            sizevertical(height: 40.0),
            Styles.regular("Select a price range",
                fs: 20, ff: "AvenirMedium", al: TextAlign.left),
            sizevertical(height: 40.0),
            RangeSlider(
              inactiveColor: skin3,
              activeColor: skin1,
              labels: RangeLabels(_starValue.toString(), _endValue.toString()),
              values: RangeValues(_starValue, _endValue),
              min: 0.0,
              max: 100.0,
              onChanged: (values) {
                setState(() {
                  _starValue = values.start.roundToDouble();
                  _endValue = values.end.roundToDouble();
                });
              },
            ),
            const Spacer(),
            Flatbtn(() {}, "APPLY", skin1),
            sizevertical(height: 15.0),
            Flatbtn(() {
              setState(() {
                _watches = false;
                _collection = false;
                _outique = false;
                _limited = false;
                _expensive = false;
                _classical = false;
                _price = false;
                _popularity = false;
                _soteria = false;
                _vase = false;
                _selling = false;
                _rating = false;
                _archeological = false;
              });
            }, "CLEAR FILTER", skin3),
          ],
        ),
      ),
    );
  }
}
