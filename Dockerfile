FROM xetys/rails-java
ADD . .
RUN bundle install
# generic = data-source-name (like: IBGE, ANVISA...)
CMD rails s -b 0.0.0.0 -d && sh -c 'java -jar bin/ms-source-generic-1.0.jar --side-app-name=cloud-rails --eureka-url=http://discovery:8761/eureka/'
EXPOSE 3000