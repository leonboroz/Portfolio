# %%
import requests

class WeatherAnalyzer:
    def __init__(self, cities):
        self.session=requests.Session()
        self.cities=cities
        self.dict_geo={}
        self.city_temp={}
        
    def get_geo(self):
        for city in self.cities:
            try:
                headers = {'User-Agent': 'data-engineer-practice'}
                url = 'https://nominatim.openstreetmap.org/search'
                params={'q':city,'format':'json'}
                response=self.session.get(url=url,headers=headers,params=params)
                response.raise_for_status()
                data=response.json()
                data1=[i for i in data if i.get('addresstype') in ('city','province')]

                if not data1:
                    print (f'Города {city} не нашлось')
                    continue
                self.dict_geo[city]={'lat':data1[0]['lat'],'lon':data1[0]['lon']}

            except requests.exceptions.RequestException as e:
                print(f"❌ Ошибка при запросе к API для '{city}': {e}")
            except (KeyError, IndexError) as e:
                print(f"❌ Ошибка обработки ответа для '{city}': {e}")
            except Exception as e:
                print(f"❌ Непредвиденная ошибка для '{city}': {e}")

    
    def get_temp(self):
        for city in self.dict_geo:
            try:
                url = 'https://api.open-meteo.com/v1/forecast'
                params={'latitude':float(self.dict_geo[city]['lat']),'longitude':float(self.dict_geo[city]['lon']),'current_weather':True}
                response=self.session.get(url=url,params=params)
                response.raise_for_status()
                data2=response.json()

                if not data2:
                    print (f'Города по этим координатам не нашлось {city} не нашлось')
                    continue
                    
                self.city_temp[city]={'date':data2['current_weather']['time'],'temp':data2['current_weather']['temperature']}
            except requests.exceptions.RequestException as e:
                print(f"❌ Ошибка при запросе к API для '{city}': {e}")
            except (KeyError, IndexError) as e:
                print(f"❌ Ошибка обработки ответа для '{city}': {e}")
            except Exception as e:
                print(f"❌ Непредвиденная ошибка для '{city}': {e}")

    def run(self):
        self.get_geo()
        self.get_temp()
        fact=max(self.city_temp.items(),key=lambda item:item[1].get('temp',0))
        print (f"""На {fact[1].get('date').split('T')[0]} самая жаркая погода из нашего списка 
               была в  городе {fact[0]} 
               с температурой воздуха {fact[1].get('temp')} градусов по Цельсию""")

# %%
