# todos los script de unix lo deben de tener (quien lo va a ejecutar)
#!/usr/bin/perl 

# que sea de la manera más estricta posible y de todos los warnings que presente
use strict;
use warnings;

my $t = time;

# abrir archivo
open(my $f, "/Users/carlostomas/Documents/Data engineering/REGEX/results_history_soccer.csv") or die ("the file does not exist");

my $match = 0;
my $nomatch = 0;

# itera imprime cada linea del archivo
while(<$f>) {
    # quita caracteres raros
    chomp;

    #empieza la REGEX  (obtiene unicamente los partidos en los que gano el equipó visitante y en que año sucedio )
    #2018-06-03,Albania,Ukraine,1,4,Friendly,Évian-les-Bains,France,TRUE
    if(m/^([\d]{4,4})\-.*?,(.*?),(.*?),(\d+),(\d+),.*$/){
        if( $5 > $4){
            printf("%s:  %s (%d) - (%d) %s\n",
            $1 , $2 , $4 , $5, $3);
        }
        $match++;
    } else {
        $nomatch++;
    }
}

close($f);

printf ("Se encontraron: \n  - %d matches\n - %d no matches\ntardo %d segundos ", $match, $nomatch, time() - $t)

#  ^\