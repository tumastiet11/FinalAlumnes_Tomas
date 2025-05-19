def copia_frase(frase, vegades, separador=None):
    """
    Copia la frase un nombre vegades de vegades. Si hi ha un separador, posa'l
    entremig de les còpies.

    >>> copia_frase('No copiaré en un examen', 3)
    'No copiaré en un examenNo copiaré en un examenNo copiaré en un examen'

    >>> copia_frase('No em cal copiar', 4, '!!!')
    'No em cal copiar!!!No em cal copiar!!!No em cal copiar!!!No em cal copiar'
    """
    return (frase+separador)*vegades
def copia_posicio_senar(llista):
    """
    Copia els elements en posicio senar d'una llista.

    >>> copia_posicio_senar([1,2,3,4])
    [1,2,2,3,4,4]

    >>> copia_posicio_senar([2,2,3,9,1])
    [2,2,2,3,9,9,1]
    """

    i=0
    llista_nova=[]
    while i<len(llista):
        if llista.index(llista[i]) % 2!=0:
            llista_nova+=[llista[i]]
            i+=1
        else:
            i+=1
    llista_nova+=llista
    return llista_nova
copia_posicio_senar([1,2,3,4])
def copia_amb_canvis(mot1, diccionari):
    """
    Copia una cadena de caràcters canviant-ne les claus del diccionari pels
    corresponents valors.

    >>> copia_amb_canvis('casa', {'a':'d'})
    'cdsd'

    >>> copia_amb_canvis('zupar', {'z':'s', 'u':'o'})
    'sopar'
    """

def corregeix(paraula, paraules):
    """
    Donada una paraula i una llista de paraules, canvia la paraula per l'element
    de paraules amb una distància de hamming més petita respecte la paraula. En
    cas que siguin de diferents longituds, tingues en compte només tants
    caràcters com tingui la paraula més curta de la parella a comparar.

    >>> corregeix('peça', ['puça', 'passa'])
    'puça'

    >>> corregeix('exàmen', ['exemple','examen','eixelebrat','examina'])
    'examen'
    """
