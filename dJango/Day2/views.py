from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from django.template import loader


from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader

def exercise1(request):
    template = loader.get_template('exercise1.html')
    msg = "장소영"
    context = {'result' : msg}
    return HttpResponse(template.render(context, request))

def exercise2(request) :
    if request.method == 'POST':
        name = request.POST['text']
        memo = request.POST['textarea']
        context = {'name':name,'memo':memo}

    else :
         context = None
    return render(request, 'exercise2.html', context)

def product1(request) :
    return render(request, 'product1.html')

def basket1(request):
    query = 'pid' in request.GET
    if query :
        result = request.GET['pid']
        context = {'result': result}
        return render(request,'basket1.html', context)