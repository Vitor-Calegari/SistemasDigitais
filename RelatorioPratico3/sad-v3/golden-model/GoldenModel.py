import PySimpleGUI as sg

sg.theme('Black')

aviso = ''
container = [
    [sg.Text("Mem_A:"), sg.InputText("", key="memA")],
    [sg.Text("Mem_B:"), sg.InputText("", key="memB")],
    [sg.Text(aviso, key = 'aviso')],
    [sg.Button("Calcula Sad"), sg.Button("Exporta .dat")]
]
window = sg.Window("Golden Model", container, font=("Gayathri", 17))

def checaStrBin(string):

    conjuntoProva = {'0', '1'}
    conjuntoTeste = set(string)

    if conjuntoProva == conjuntoTeste:
        return True
    else:
        return False

def calculaSad(values):
    memA = str(values["memA"])
    memB = str(values["memB"])
    if memA.isnumeric() and memB.isnumeric() and checaStrBin(memA) and checaStrBin(memB):
        sad = sad_v3.calcula(memA, memB)
        return sad
    else:
        raise Exception('Insira valores válidos')
    
rodando = True 
while rodando:
    event, values = window.read()
    if event == sg.WIN_CLOSED:
        rodando = False
    elif event == 'Calcula Sad':
        try:
            aviso = calculaSad(values)
        except:
            aviso = 'Insira valores válidos!'
        window.Element('aviso').Update(aviso)

window.close()