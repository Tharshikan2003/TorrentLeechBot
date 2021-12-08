FROM ubuntu:20.04


RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

RUN apt -qq update --fix-missing && \
    apt -qq install -y git \
    aria2 \
    wget \
    curl \
    busybox \
    unzip \
    unrar \
    tar \
    python3 \
    ffmpeg \
    python3-pip \
    p7zip-full \
    p7zip-rar

RUN wget https://rclone.org/install.sh
RUN bash install.sh

RUN mkdir /app/gautam
RUN wget -O /app/gautam/gclone.gz https://git.io/JJMSG
RUN gzip -d /app/gautam/gclone.gz
RUN chmod 0775 /app/gautam/gclone

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
[leechgroup1]
type = drive
client_id = 911246878007-mdt714i7n4gf9945snf2ce2bh34679qq.apps.googleusercontent.com
client_secret = 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
scope = drive
root_folder_id = 1BrYGioBA5wilyI0nPoNkkrCezaP5SKDb
token = {"access_token":"ya29.a0ARrdaM-ZdtHYlEf8_Oeid4IPVvKGidnaiUHE8nn32SsEWjtWmxhHeX6mlXHjKt0XhCFBsPhEScnDnvHZciekbtGxJX-N7KqBAewQkseY83CwElsMY6WXEjWB8Ifvj6Wz2X6-GW3eg65unkKRAb5grLJl_o_D","token_type":"Bearer","refresh_token":"1//0gSHxwr34omIdCgYIARAAGBASNwF-L9IrM5Ee_lrlAJb5ncWR0Bq8njYrixmjpOjgURlckQr9oTtEiIxrjqtn0pDM57GA0BKR9-8","expiry":"2021-12-02T16:08:03.315629+05:30"}
team_drive = 0ANsoAoTsy-dEUk9PVA
#RUN chmod +x extract
CMD ["bash","start.sh"]
