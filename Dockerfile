FROM jmll/ocpu-server:2.2

ENV BRANCH 0.1.2

## install r-packages
RUN  cd ~ \
  && wget --quiet https://git.nilu.no/rfriendlyr/friendlyr/-/archive/${BRANCH}/friendlyr-${BRANCH}.tar.gz \
  && tar xzf friendlyr-${BRANCH}.tar.gz \
  && cd friendlyr-${BRANCH} \
  && Rscript ./lib/buildpkgs.R \
  && Rscript ./lib/install.R pkg friendlyr branch ${BRANCH} dir ~ \
  && cd .. \
  && rm -r friendlyr-${BRANCH} \
  && rm friendlyr-${BRANCH}.tar.gz
