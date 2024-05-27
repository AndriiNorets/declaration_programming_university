class Impreza:
    def __init__(self, nazwa: str, goscie: list, muzyka: dict, catering: dict) :
        self.nazwa = nazwa
        self.goscie = goscie
        self.muzyka = muzyka
        self.catering = catering
        self.liczba_gosci = len(goscie)
        self.miejsce = self.wybierz_miejsce(self.liczba_gosci)

    def dodaj_goscia(self, gosc: str):
        if gosc not in self.goscie:
            self.goscie.append(gosc)
            self.liczba_gosci += 1

    def usun_goscia(self, gosc: str):
        if gosc in self.goscie:
            self.goscie.remove(gosc)
            self.liczba_gosci -= 1

    def koszt_calosciowy(self):
        koszt_miejsca = self.miejsce['cena']
        koszt_muzyki = self.muzyka['cena']
        koszt_cateringu = self.catering['cena'] * self.liczba_gosci
        return koszt_miejsca + koszt_muzyki + koszt_cateringu
    
    def wybierz_miejsce(self, liczba_gosci):

        miejsca = [
            {'nazwa': 'Restauracja', 'pojemnosc': 50, 'cena': 1000},
            {'nazwa': 'Klub', 'pojemnosc': 100, 'cena': 2000},
            {'nazwa': 'Sala Koncertowa', 'pojemnosc': 200, 'cena': 3000}
        ]

        for miejsce in miejsca:
            if liczba_gosci <= miejsce['pojemnosc']:
                return miejsce
        return None 
    
    def impreza_info(self):
        return f'Nazwa imprezy: {self.nazwa}, \n' \
               f'Goscie: {self.goscie}, \n' \
               f'Liczba_gosci: {self.liczba_gosci}, \n' \
               f'Miejsce: {self.miejsce}, \n' \
               f'Muzyka: {self.muzyka}, \n' \
               f'Catering: {self.catering}, \n' \
               f'Koszt calosciowy: {self.koszt_calosciowy()} \n'




goscie = ['Tomasz Zieliński', 'Agnieszka Wiśniewska', 'Marek Kowalski', 'Katarzyna Nowak']
muzyka = {'nazwa': 'Zespol The Weekend', 'cena': 3000}
catering = {'nazwa': 'Firma Y', 'typ': 'tradycyjny', 'cena': 70}

impreza = Impreza('Spotkanie z kolegami', goscie, muzyka, catering)

print(impreza.impreza_info())

# Nazwa imprezy: Spotkanie z kolegami,
# Goscie: ['Tomasz Zieliński', 'Agnieszka Wiśniewska', 'Marek Kowalski', 'Katarzyna Nowak'],
# Liczba_gosci: 4,
# Miejsce: {'nazwa': 'Restauracja', 'pojemnosc': 50, 'cena': 1000},
# Muzyka: {'nazwa': 'Zespol The Weekend', 'cena': 3000},
# Catering: {'nazwa': 'Firma Y', 'typ': 'tradycyjny', 'cena': 70},
# Koszt calosciowy: 4280


goscie_2 = [
    'Jan Kowalski', 'Anna Nowak', 'Piotr Wiśniewski', 'Maria Lewandowska',
    'Krzysztof Nowak', 'Ewa Kowalczyk', 'Tomasz Zieliński', 'Agnieszka Wiśniewska',
    'Marek Kowalski', 'Katarzyna Nowak', 'Michał Wójcik', 'Paweł Kamiński',
    'Magdalena Zielińska', 'Łukasz Woźniak', 'Joanna Kowalska', 'Robert Lewandowski',
    'Edyta Nowicka', 'Adam Wiśniewski', 'Natalia Zając', 'Dorota Kowalska',
    'Karol Nowakowski', 'Daria Kowalska', 'Igor Wiśniewski', 'Patrycja Zielińska',
    'Szymon Nowak', 'Klaudia Kowalczyk', 'Maciej Zieliński', 'Oliwia Kowalska',
    'Krzysztof Kowalczyk', 'Monika Nowak', 'Jakub Wiśniewski', 'Barbara Kowalska',
    'Mateusz Zieliński', 'Alicja Kowalczyk', 'Janusz Nowak', 'Aneta Kowalska',
    'Bartosz Kowalczyk', 'Sylwia Nowak', 'Marcin Wiśniewski', 'Agnieszka Kowalska',
    'Andrzej Nowak', 'Izabela Kowalczyk', 'Tadeusz Zieliński', 'Marta Kowalska',
    'Janina Nowak', 'Krzysztof Kowalczyk', 'Patryk Wiśniewski', 'Joanna Zielińska',
    'Piotr Nowak', 'Renata Kowalczyk','Jan Kowalski',
]
muzyka_2 = {'nazwa': 'DJ Fisher', 'cena': 500}
catering_2 = {'nazwa': 'Firma Z', 'typ': 'weganski', 'cena': 60}

impreza_2 = Impreza('Live concert', goscie_2, muzyka_2, catering_2)

print(impreza_2.impreza_info())

# Nazwa imprezy: Live concert,
# Goscie: ['Jan Kowalski', 'Anna Nowak', 'Piotr Wiśniewski', 'Maria Lewandowska', 'Krzysztof Nowak', 'Ewa Kowalczyk', 'Tomasz Zieliński', 'Agnieszka Wiśniewska', 'Marek Kowalski', 'Katarzyna Nowak', 'Michał Wójcik', 'Paweł Kamiński', 'Magdalena Zielińska', 'Łukasz Woźniak', 'Joanna Kowalska', 'Robert Lewandowski', 'Edyta Nowicka', 'Adam Wiśniewski', 'Natalia Zając', 'Dorota Kowalska', 'Karol Nowakowski', 'Daria Kowalska', 'Igor Wiśniewski', 'Patrycja Zielińska', 'Szymon Nowak', 'Klaudia Kowalczyk', 'Maciej Zieliński', 'Oliwia Kowalska', 'Krzysztof Kowalczyk', 'Monika Nowak', 'Jakub Wiśniewski', 'Barbara Kowalska', 'Mateusz Zieliński', 'Alicja Kowalczyk', 'Janusz Nowak', 'Aneta Kowalska', 'Bartosz Kowalczyk', 'Sylwia Nowak', 'Marcin Wiśniewski', 'Agnieszka Kowalska', 'Andrzej Nowak', 'Izabela Kowalczyk', 'Tadeusz Zieliński', 'Marta Kowalska', 'Janina Nowak', 'Krzysztof Kowalczyk', 'Patryk Wiśniewski', 'Joanna Zielińska', 'Piotr Nowak', 'Renata Kowalczyk', 'Jan Kowalski'],
# Liczba_gosci: 51,
# Miejsce: {'nazwa': 'Klub', 'pojemnosc': 100, 'cena': 2000},
# Muzyka: {'nazwa': 'DJ Fisher', 'cena': 500},
# Catering: {'nazwa': 'Firma Z', 'typ': 'weganski', 'cena': 60},
# Koszt calosciowy: 5560

