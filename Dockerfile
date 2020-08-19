FROM jmll/ocpu-server:2.2

ENV BRANCH 0.1
ENV FRIEND_BRANCH 0.1.2

RUN  cd ~ \
  && wget --quiet https://git.nilu.no/roya/roya-server/-/archive/${BRANCH}/roya-server-${BRANCH}.tar.gz \
  && tar xzf roya-server-${BRANCH}.tar.gz \
  && cd roya-server-${BRANCH} \
  && Rscript ./lib/buildpkgs.R \
  && cd .. \
  && rm -r roya-server-${BRANCH} \
  && rm roya-server-${BRANCH}.tar.gz

RUN  cd ~ \
  && wget --quiet https://git.nilu.no/rfriendlyr/friendlyr/-/archive/${FRIEND_BRANCH}/friendlyr-${FRIEND_BRANCH}.tar.gz \
  && tar xzf friendlyr-${FRIEND_BRANCH}.tar.gz \
  && cd friendlyr-${FRIEND_BRANCH} \
  && Rscript ./lib/buildpkgs.R \
  && Rscript ./lib/install.R pkg friendlyr branch ${FRIEND_BRANCH} dir ~ \
  && cd .. \
  && rm -r friendlyr-${FRIEND_BRANCH} \
  && rm friendlyr-${FRIEND_BRANCH}.tar.gz
