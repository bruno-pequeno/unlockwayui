import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/routine/components/routine_edit_page.dart';

class RoutineCard extends StatelessWidget {
  const RoutineCard({
    super.key,
    required this.name,
    required this.weekRepetitions,
    required this.calories,
    required this.meals,
    required this.color,
    required this.using,
  });

  final String name;
  final List<bool> weekRepetitions;
  final double calories;
  final List<Object> meals;
  final Color color;
  final bool using;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            navigationPageRightAnimation(
              const EditRoutine(),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svgs/calendar.svg",
                    width: 32,
                    height: 32,
                  ),
                  Text(
                    "Rotina: $name",
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              DaysList(
                days: weekRepetitions,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: ButtonStyle(
                        fixedSize: const MaterialStatePropertyAll(
                          Size(77, 30),
                        ),
                        backgroundColor: using
                            ? const MaterialStatePropertyAll(
                                Color(0XFFF7BEA1),
                              )
                            : const MaterialStatePropertyAll(
                                Colors.transparent,
                              ),
                        side: using
                            ? const MaterialStatePropertyAll(
                                BorderSide(
                                  width: 0,
                                  color: Colors.transparent,
                                ),
                              )
                            : MaterialStatePropertyAll(
                                BorderSide(
                                  width: 2,
                                  color: Color(darkBgdark),
                                ),
                              )),
                    onPressed: () {},
                    child: Text(
                      using ? "USANDO" : "USAR",
                      style: TextStyle(
                        color:
                            using ? Color(darkBgdark) : const Color(0XFFF39668),
                        fontFamily: "Inter",
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/svgs/Fire.svg"),
                      Text(
                        calories.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE96016),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}