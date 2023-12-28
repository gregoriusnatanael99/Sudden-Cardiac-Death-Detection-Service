FROM gregoriusnatanael99/scd_flask:cloud

ENV APP_HOME /app 
WORKDIR $APP_HOME

EXPOSE 8003

CMD python3 app.py