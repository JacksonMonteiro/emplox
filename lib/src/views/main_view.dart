// ignore_for_file: prefer_const_constructors

import 'package:emplox/src/presenters/main_screen_presenter.dart';
import 'package:emplox/src/views/update_employee_screen.dart';
import 'package:flutter/material.dart';

class MainViewScreen extends StatefulWidget {
  const MainViewScreen({Key? key}) : super(key: key);

  @override
  State<MainViewScreen> createState() => _MainViewScreenState();
}

class _MainViewScreenState extends State<MainViewScreen>
    implements MainScreenContract {
  late MainScreenPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: presenter.state,
        builder: (context, child) =>
            presenter.stateManagement(presenter.state.value),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32, right: 16),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/employee_register');
          },
          backgroundColor: Color(0xFF07B0E5),
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    presenter = MainScreenPresenter(this);

    presenter.start();
  }

  @override
  error() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 96, left: 30, right: 30),
          child: Column(
            children: [
              Text('Funcionários',
                  style: TextStyle(
                      color: Color(0xff07b0e5),
                      fontWeight: FontWeight.w500,
                      fontSize: 24)),
              Text('Clique no card para editar o usuário',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
              Padding(
                padding: const EdgeInsets.only(top: 81),
                child: Text(
                    'Ocorreu alguma problema ao tentar mostrar os usuários',
                    style: TextStyle(
                        color: Color(0xff07b0e5),
                        fontWeight: FontWeight.w500,
                        fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  success() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 96, left: 30, right: 30),
          child: Column(
            children: [
              Text('Funcionários',
                  style: TextStyle(
                      color: Color(0xff07b0e5),
                      fontWeight: FontWeight.w500,
                      fontSize: 24)),
              Text('Clique no card para editar o usuário',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
              ListView.builder(
                  itemCount: presenter.employees.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var employee = presenter.employees[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => updateEmployeeScreen(
                                  employeeId: employee.id)),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: 300,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0xFFEFEFEF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            employee.name.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 22,
                                                color: Color(0xFF07B0E5)),
                                          ),
                                          Text(
                                            employee.role.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                color: Colors.black),
                                          )
                                        ]),
                                    GestureDetector(
                                      onTap: () {
                                        presenter.delete(employee.id);
                                      },
                                      child: Icon(
                                        Icons.delete_rounded,
                                        color: Colors.red,
                                        size: 48,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  isLoadingChange() {
    setState(() {});
  }

  @override
  loading() {
    return Center(
        child: presenter.isLoading ? CircularProgressIndicator() : Container());
  }
}
