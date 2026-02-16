##################################################
# Come usare GITHUB da PositCloud
##################################################

# Questo file contiene le istruzioni per inviare le presentazioni
# dal proprio Positcloud to GitHub (rladies/meetup-presentations_rome)

# Una volta clonato il repository rladies/meetup-presentations_rome
# si creerà un repository <YOUR-USER-NAME>/meetup-presentations_rome sul
# proprio account GitHub

# Aprire un NEW PROJECT su PositCloud
# Scegliere git repository e inserire l'indirizzo del nuovo repository appena creato
# https://github.com/<YOUR-USER-NAME>/meetup-presentations_rome

# Per poter inviare le proprie presentazioni al repository principale, da Positcloud
# è necessario creare una nuova branch (NON USARE - MAIN - BRANCH)

# Procedere all'autenticazione
# IN TERMINAL
git config --global user.email "you@example.com"
git config --global user.name "Your User Name"
git push --set-upstream origin <la-tua-nuova-branch> # questo step richiede un token (se non già attivato)

# IN CONSOLE
install.packages("usethis") # posit cloud richiede l'installazione dei pacchetti ogni nuova sessione
usethis::create_github_token() # apre una pagina git dove prendere il token
gitcreds::gitcreds_set() # inserisci token

########################################################
# Origine e Upstream
########################################################
# L'Origine è il repository originale (rladies/meetup-presentations_rome)
# L'Upstream è il proprio repository (<YOUR-USER-NAME>/meetup-presentations_rome)
# l'upstream è inteso essere quello della MAIN branch.

# Quando si invia un file o una modifica ad un file, si deve inviare da un'altra branch
# per questo è necessario fissare l'UPSTREAM

usethis::use_git() # ti chiede: Is it ok to commit it? sure!
# i comandi che seguono sono per controllare se è tutto ok
# se non funziona prosegui con i comandi successivi
usethis::pr_init("<la-tua-nuova-branch>") # iniziazione della nuova branch (informa git che c'è una nuova branch)
# commit i cambiamenti fatti e poi inviali
usethis::pr_push() # manda i cambiamenti


# se dice "upstream = <not configured>" - fa sapere all'origine della nuova branch
# IN TERMINAL
git remote add upstream https://github.com/<your-user-name>/meetup-presentations_rome
# controlla che l'origine sia fissata
git remote add origin https://github.com/rladies/meetup-presentations_rome


# in generale quando le credenziali sono fissate si possono usare i seguenti comandi
# IN TERMINAL
git pull # (scarica i cambiamenti dall'origine)
git push # (push/manda i cambiamenti all'origine)


## quando si crea un'altra branch (dopo la prima creata)
## in posit cloud si deve ripetere la procedura
# IN CONSOLE
gitcreds::gitcreds_set() # inserire dinuovo le credenziali create
usethis::pr_init("<la-tua-nuova-branch>")
# commit i cambiamenti dalla nuova branch e poi
# IN TERMINAL
git push
# ricordare di controllare sul proprio repository di avere
# una PULL REQUEST e cliccare il pulsante verde per inviarla.