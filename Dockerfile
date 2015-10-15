FROM vertx/vertx3

#                                                       (1)
ENV VERTICLE_NAME io.skubij.vertx.Myapp
ENV VERTICLE_FILE target/skubij-verticle-1.0-SNAPSHOT.jar

# Set the location of the verticles
ENV VERTICLE_HOME /usr/verticles

EXPOSE 8080

# Copy your verticle to the container                   
COPY $VERTICLE_FILE $VERTICLE_HOME/

# Launch the verticle
WORKDIR $VERTICLE_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["vertx run $VERTICLE_NAME -cp $VERTICLE_HOME/*"]
