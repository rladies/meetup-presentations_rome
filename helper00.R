# IN TERMINAL
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git push --set-upstream origin <la-tua-nuova-branch>

# IN CONSOLE
install.packages("usethis") # posit cloud richiede l'installazione dei pacchetti ogni nuova sessione
usethis::create_github_token() # apre una pagina git dove prendere il token
gitcreds::gitcreds_set() # dopo ti chiede di mattere il token
usethis::use_git() # ti chiede: Is it ok to commit it? sure!
# i comandi che seguono sono per controllare se è tutto ok
# se non funziona prosegui con i comandi successivi
usethis::pr_init("<la-tua-nuova-branch>")
usethis::pr_pull_upstream()
usethis::pr_push()

# se ti dice "upstream = <not configured>" - per far sapere all'origine della tua branch
# IN TERMINAL
git remote add upstream https://github.com/<your-user-name>/meetup-presentations_rome
# controlla che l'origine sia fissata
git remote add origin https://github.com/rladies/meetup-presentations_rome
# manda la presentazione e setta la nuova branch
git push --set-upstream origin <la-tua-nuova-branch>
# controlla che tutto sia passato al repository originale
# in terminal
git pull # (scarica i cambiamenti dall'origine)
git push # (push/manda i cambiamenti all'origine)


## quando si crea un'altra branch (dopo la prima creata)
## in posit cloud si deve ripetere la procedura
IN CONSOLE
gitcreds::gitcreds_set() # inserire dinuovo le credenziali create
usethis::pr_init("<la-tua-nuova-branch>")
# commit i cambiamenti dalla nuova branch
