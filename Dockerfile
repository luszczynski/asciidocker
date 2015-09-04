FROM fedora:22

RUN mkdir /documents && chmod o+rw /documents

VOLUME /documents
WORKDIR /documents

ENV REFRESHED_AT 04092015

RUN dnf install -y ruby ruby-devel rubygems graphviz rubygem-nokogiri asciidoctor python-devel zlib-devel

RUN gem install --no-ri --no-rdoc asciidoctor-epub3 --version 1.0.0.alpha.2 && \
	gem install --no-ri --no-rdoc asciidoctor-pdf --version 1.5.0.alpha.7 && \
	gem install --no-ri --no-rdoc coderay pygments.rb thread_safe epubcheck kindlegen && \
	gem install --no-ri --no-rdoc asciidoctor-diagram && \
	gem install --no-ri --no-rdoc slim && \
    	gem install --no-ri --no-rdoc haml tilt && \
	gem install --no-ri --no-rdoc asciinurse

RUN echo "alias asciinurse='asciidoctor -r asciinurse'" >> /root/.bashrc

CMD ["asciidoctor"]
