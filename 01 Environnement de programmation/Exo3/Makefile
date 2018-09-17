compile:
	gcc -o exo3 -Wall exo3.c -lm

run:
	./exo3

count:
	wc nombre.data
	
sort:
	sort -n -o nombres_tries.data nombre.data
	
printSort:
	geany nombres_tries.data &
	
uniq:
	uniq nombres_tries.data nombres_uniq.data
	wc nombres_uniq.data

clean:
	rm -f nombre.data
	rm -f nombres_tries.data
	rm -f nombres_uniq.data
	rm -f exo3
