FROM python:3.7

ADD ./requirements.txt /

# Upgrade installed packages
RUN apt-get update && apt-get upgrade -y && apt-get clean

# RUN apt-get install python3.7-dev
RUN apt-get install -y libproj-dev proj-data proj-bin
RUN apt-get install -y libgeos-dev
RUN pip install -r requirements.txt

EXPOSE 8501

WORKDIR /usr/src/app

CMD ["streamlit", "run", "/usr/src/app/dashboard/Covid19.py"]