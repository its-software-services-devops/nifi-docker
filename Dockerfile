FROM apache/nifi:1.14.0

COPY custom.bash /opt/nifi/scripts
RUN ls -lrt /opt/nifi/scripts

RUN echo $(date) > /tmp/date.txt

ENTRYPOINT ["../scripts/custom.bash"]
