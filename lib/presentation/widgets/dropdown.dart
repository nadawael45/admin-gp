import 'package:admingp/domain/cubit/dropdown/dropdown_cubit.dart';
import 'package:admingp/domain/cubit/dropdown/dropdown_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDown extends StatelessWidget {

  List? list;
  String? hint;
DropDown(this.hint);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropDownCubit,DropDownStates>(

      builder: (context,state) {
        list=DropDownCubit.get(context).categoryList;
        return ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: DropDownCubit.get(context).dropDownValue == null
                  ? Text(hint!)
                  : Text(
                DropDownCubit.get(context).dropDownValue,
                style: TextStyle(color: Colors.black),
              ),
              isExpanded: true,
              iconSize: 30.0,
              style: TextStyle(color: Colors.black),
              items: list!.map(
                    (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (val) {
                DropDownCubit.get(context).changeVal(val);
                print(val);
                print('======================');

              },
            ),
          ),
        );
      }
    );

  }
}