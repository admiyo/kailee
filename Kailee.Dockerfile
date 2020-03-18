FROM admiyo/rlang
MAINTAINER Adam Young <adam@younglogic.com>

COPY ./ ./
CMD R -e "shiny::runApp('./app.R', port="2112")"
EXPOSE 2112
