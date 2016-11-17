FROM python:3.5.2-alpine
RUN apk --no-cache add openssl
WORKDIR /usr/src/ddc-opencontrol
COPY requirements.txt .
RUN pip install -r requirements.txt
ADD https://raw.githubusercontent.com/opencontrol/schemas/master/kwalify/component/v3.1.0.yaml .
COPY opencontrol.yaml test_component_validity.py /usr/src/ddc-opencontrol/
COPY CSEngine CSEngine/
COPY DTR DTR/
COPY UCP UCP/
CMD ["py.test"]