FROM jmll/ocpu-server:2.2

ENV BRANCH 0.1
ENV GLOW_BRANCH 0.0.1
RUN  cd ~ \
  && wget --quiet https://git.nilu.no/roya/roya-server/-/archive/${BRANCH}/roya-server-${BRANCH}.tar.gz \
  && tar xzf roya-server-${BRANCH}.tar.gz \
  && cd roya-server-${BRANCH} \
  && Rscript ./lib/buildpkgs.R \
  && cd .. \
  && rm -r roya-server-${BRANCH} \
  && rm roya-server-${BRANCH}.tar.gz

RUN  cd ~ \
  && wget --quiet https://git.nilu.no/rglow/glow/-/archive/${GLOW_BRANCH}/glow-${GLOW_BRANCH}.tar.gz \
  && tar xzf glow-${GLOW_BRANCH}.tar.gz \
  && cd glow-${GLOW_BRANCH} \
  && Rscript ./lib/buildpkgs.R \
  && Rscript ./lib/install.R pkg glow branch ${GLOW_BRANCH} dir ~ \
  && cd .. \
  && rm -r glow-${GLOW_BRANCH} \
  && rm glow-${GLOW_BRANCH}.tar.gz
