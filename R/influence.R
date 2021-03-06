influence <-
function(screen.name,user.id=NA) {
    if(is.na(user.id)) {
        influence.url<-paste(.InfochimpsEnv$data$base,"influence.json?screen_name=",screen.name,"&apikey=",.InfochimpsEnv$data$api.key,sep="")
    }
    else{
        influence.url<-paste(.InfochimpsEnv$data$base,"influence.json?user_id=",user.id,"&apikey=",.InfochimpsEnv$data$api.key,sep="")
    }
    influence.get<-getURL(influence.url)
    influence.data<-fromJSON(influence.get)
    # Simple error checking
    if(is.null(influence.data$error)){
        return(influence.data)
    }
    else {
        warning(influence.data$message[[1]])
        return(NA)
    }
}

