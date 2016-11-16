FROM fedora:24

RUN mkdir /documents && chmod o+rw /documents

VOLUME /documents
WORKDIR /documents

ENV REFRESHED_AT 16112016

RUN dnf install -y tar make gcc ruby ruby-devel rubygems graphviz rubygem-nokogiri asciidoctor unzip findutils which wget python-devel zlib-devel redhat-rpm-config

RUN gem install --no-ri --no-rdoc asciidoctor-epub3 --version 1.5.0.alpha.6 && \
	gem install --no-ri --no-rdoc asciidoctor-pdf --version 1.5.0.alpha.13 && \
	gem install --no-ri --no-rdoc coderay pygments.rb thread_safe epubcheck kindlegen && \
	gem install --no-ri --no-rdoc asciidoctor-diagram && \
	gem install --no-ri --no-rdoc slim && \
    gem install --no-ri --no-rdoc haml tilt && \
	gem install --no-ri --no-rdoc asciinurse

RUN echo "alias asciinurse='asciidoctor -r asciinurse'" >> /root/.bashrc

CMD ["asciidoctor"]
