# KnuMovieWeb
COMP322 project
class _KnuMovieState extends State<KnuMovie> {
  @override
  Widget build(BuildContext context) {
    return MovieProvider(
      movieBloc: MovieBloc(API()),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild.unfocus();
          }
        },
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Knu Movie',
            theme: ThemeData(
              primarySwatch: generateMaterialColor(Pallette.primary),
              fontFamily: "Montserrat",
            ),
            home: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.red[400], Colors.red[300]]),
                ),
                child: Column(
                  children: <Widget>[
                    Navbar(),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: LandingPage(),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

