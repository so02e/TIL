URL 을 어떻게 주느냐에 따라 달라짐. 



study 안의 url 은 main

```
from django.contrib import admin
from django.urls import path, include
import firstapp.views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('welcome/',firstapp.views.welcome),
                     패키지명 
    path('secondapp/',include('secondapp.urls')), // secondapp 안의 url.py를 포함하겠다.
    
]
```



secondapp 안의 url

```
from django.urls import path
from.import views
urlpatterns = [
    path('',views.exam1, name='exam1'),
           패키지 명을 줄 필요가 없다. 
]
```



viewsv파일

```
from django.http import HttpResponse
from django.template import loader

def exam1(request):
    template = loader.get_template('exam1.html')
    return HttpResponse(template.render(None, request))
```





http://localhost:8000/secondapp/exam2/

-> path('exam2/',views.exam2, name='exam2'),







http://localhost:8000/secondapp/exam2_1/

-> path('exam2/',views.exam2, name='exam2'),







view는 간단한 응답.

복잡한 html은 view에서 응답하는 것은 적절하지 않다.  **"템플릿"**

템플릿은 html로 만들어 적용한다.



