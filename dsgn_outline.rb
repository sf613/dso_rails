
komponenty : 

1 obrobka danych
2 generyczny klik na ekranie
3 obszary ekranu
4 rozpoznawanie obrazkow

1 -> ruby
2 -> java (-> jruby) 
3,4 -> sikuli (-> jruby)

4 od biedy moznaby wywalic ale moze sie przydac do walidowania; jesli nie ma zadnego dzialajacego frameworka do klikow to i tak trzeba z robota korzystac wiec nie ominie sie jruby

jruby script_name OPTS

-- zainstalowane railsy poprzez jruby -S gem install rails, sprawdzic czy sie da sprawdzic czy w ten sposob sa jakos bindowane executable railsowe do jruby zamiast rubyego (dobre pytanie bo example jaki znalazlem byl dla rvm, a rvm robi install w kontekscie wybranego przelaczonego srodowiska a nie globalnie)
# dodane do gemfile, znalazlem info odnosnie wymuszania wersji wiec powinno to dzialac

punkty integracji : 

abstract_bot.composite_action   - jesli ARGV[1] = 'buffs' to reszta listy argumentow jest expandowalna lista typow budynkow do buffowania #REFACTOR chyba mozna zostawic koncepcyjnie to samo bo to jest sumowane do 1 dlugiej czynnosci i mozna to bez problemow tak wykonywac. 

abstract_bot.produce_units - jesli ARGV[1] = 'units' to dalej typ unitow i ich liczba do dodania do listy #REFACTOR do nowego UI

znajdowanie zasobow - wchodzi w sklad composite_action

Class FromRails
	
	bot = Mainbot.new("home")
	#get args from the form
	#refactor to use args instead of command line args
	begin
		Task.create(@task, "initiated")
		bot.composite_action(*args)
		Task.update(@task, "finished")
	rescue
		Task.update(@task, "error")
	end	

end

abstractmultibot < abstractbot # overload metod ze wzgledu na to, ze z perspektywy multi buffowanie np wymaga wejscia na widok maina; do konca nie wiadomo czy to bedzie konieczne przy buffach 24h ale niech zostanie

multiX  - klasy ograniczaja sie do trzymania info o przegladarce i path do plikow; jest ref do csv z koordynatami ale nie jest wykorzystywany, bo na razie nie bylo buffowania samego siebie (moznaby w przyszlosci dodac ?); ref do coordow na mainie jest w metodach abstractmultibota; hardcodowanych atrybutow nie ma wiec nie ma sensu tworzyc oddzielnego modulu ze stalymi
TODO : sprawdzic mozliwosc obsluzenia logowania za pomoca Selenium