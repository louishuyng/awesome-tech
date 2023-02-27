s = 'Peter Piper picked a peck of pickled peppers'
s.scan(/[Pp]\w*/) { |word| puts("The word is #{word}") }
