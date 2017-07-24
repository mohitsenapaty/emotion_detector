# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.views.decorators.csrf import csrf_exempt

from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from . import send_email
import json, matplotlib, time
import matplotlib.pyplot as plt
import datetime as dt
from .models import *
import MySQLdb 


glob_float_att_array = []
glob_att_id_ = 0
glob_att_x_arr = []

glob_float_emo_dict = {"angry":[0], "sad":[0], "surprised":[0], "happy":[0]}

glob_emo_file = ""
glob_att_file = ""

# Create your views here.
# Create your views here.
def eye_gaze_tracker(request):
    context = locals()
    from ipware.ip import get_real_ip
    ip_arr = []
    ip_real = get_real_ip(request)
    if ip_real is not None:
        ip_arr.append(ip_real)
    else:
        ip_arr.append('')
    
    from ipware.ip import get_ip
    #ip_arr = []
    ip = get_ip(request)
    if ip is not None:
        ip_arr.append(ip)
    else:
        ip_arr.append('')

    f1 = open("ip.txt", "a")
    for x in ip_arr:
        f1.write(x)
        f1.write('eye gaze tracker\n')
    f1.close()

    glob_float_att_array = []
    glob_att_id_ = 0
    glob_att_x_arr = []

    is_logged_in = 0
    if not request.session.get("username") == None:
        #return HttpResponseRedirect('/combined_app/')
        is_logged_in = 1

    
    template = 'eye_gaze_tracker.html'
    returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username")}
    return render(request, template, returnDict)

def home(request):
    context = locals()
    from ipware.ip import get_real_ip
    ip_arr = []
    ip_real = get_real_ip(request)
    if ip_real is not None:
        ip_arr.append(ip_real)
    else:
        ip_arr.append('')
    
    from ipware.ip import get_ip
    #ip_arr = []
    ip = get_ip(request)
    if ip is not None:
        ip_arr.append(ip)
    else:
        ip_arr.append('')

    f1 = open("ip.txt", "a")
    for x in ip_arr:
        f1.write(x)
        f1.write('home\n')
    f1.close()

    is_logged_in = 0
    if not request.session.get("username") == None:
        #return HttpResponseRedirect('/combined_app/')
        is_logged_in = 1

    template = 'home.html'
    returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username"), 'logintype':request.session.get("type")}
    return render(request, template, returnDict)   

def emotion_detector(request):
    context = locals()
    from ipware.ip import get_real_ip
    ip_arr = []
    ip_real = get_real_ip(request)
    if ip_real is not None:
        ip_arr.append(ip_real)
    else:
        ip_arr.append('')
    
    from ipware.ip import get_ip
    #ip_arr = []
    ip = get_ip(request)
    if ip is not None:
        ip_arr.append(ip)
    else:
        ip_arr.append('')

    f1 = open("ip.txt", "a")
    for x in ip_arr:
        f1.write(x)
        f1.write('emotion detector\n')
    f1.close()

    glob_float_emo_dict = {"angry":[0], "sad":[0], "surprised":[0], "happy":[0]}
    glob_emo_id_ = 0
    glob_emo_x_arr = []

    is_logged_in = 0
    if not request.session.get("username") == None:
        #return HttpResponseRedirect('/combined_app/')
        is_logged_in = 1

    template = 'emotion_detector.html'
    returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username")}
    return render(request, template, returnDict)

@csrf_exempt
def get_attention_data(request):
    #fromJs = json.loads(request.POST)
    #print fromJs
    #import pdb; pdb.set_trace();
    att_array = request.POST.getlist(u'colAttentionData[]')
    is_logged_in = 0
    _username = request.session.get("username", "")
    if not _username == "":
        #return HttpResponseRedirect('/combined_app/')
        is_logged_in = 1
        #_username = 
    float_att_array = []
    id_ = 0
    x_arr = []
    for att in att_array:
        float_att_array.append(float(att))
        id_ += 1
        x_arr.append(id_)
    plt.plot(x_arr, att_array)
    plt.xlabel("time in seconds")
    plt.ylabel("attention level in percent")
    plt_file_name = "attention_data_"
    dt_timestamp = dt.datetime.fromtimestamp(time.time()).strftime("%Y_%m_%d_%H_%M_%S")
    plt_file_name = _username + plt_file_name+dt_timestamp+".png"
    plt.savefig(plt_file_name)
    plt.gcf().clear()
    glob_att_file = plt_file_name
    global glob_emo_file
    send_email.send_email("date:val time:val", "dharna graph for user", [glob_att_file, glob_emo_file])
    return HttpResponse("Success!")


@csrf_exempt
def get_emotion_data(request):
    #fromJs = json.loads(request.POST)
    #print fromJs
    #import pdb; pdb.set_trace();
    post_array = request.POST
    is_logged_in = 0
    _username = request.session.get("username", "")
    if not _username == "":
        #return HttpResponseRedirect('/combined_app/')
        is_logged_in = 1
    i_ = 0
    j_ = 0
    emo_dict = {"angry":[0], "sad":[0], "surprised":[0], "happy":[0]}
    while (1):
        flag = 0
        for j_ in range(4):
            qe_str = 'data['+str(i_)+"]["+str(j_)+"][emotion]"
            qv_str = 'data['+str(i_)+"]["+str(j_)+"][value]"
            emo_ = post_array.getlist(qe_str)
            val_ = post_array.getlist(qv_str)
            if emo_==None or len(emo_) == 0:
                flag = 1
                break
            else:
                emo_list = emo_dict.get(emo_[0])
                if emo_list == None or len(emo_list) == 0:
                    pass
                else:
                    emo_dict[emo_[0]].append(val_[0])

        i_ = i_+1
        if flag == 1:
            break

    #print emo_dict
    #float_emotion_array = []
    #id_ = 0
    #x_arr = []
    plot_key = []
    for emo_key in emo_dict:
        emo_arr = emo_dict[emo_key]
        p_key = "y = "+emo_key
        plot_key.append(emo_key)
        float_emo_arr = []
        x_arr = []
        id_ = 0
        for emo_val in emo_arr:
            float_emo_arr.append(float(emo_val))
            x_arr.append(id_)
            id_+=1
        plt.plot(x_arr, float_emo_arr)
    plt.legend(plot_key, loc='upper left')


    #    float_att_array.append(float(att))
    #    id_ += 1
    #    x_arr.append(id_)
    #plt.plot(x_arr, att_array)
    plt.xlabel("time in seconds")
    plt.ylabel("weighted emotion value")
    plt_file_name = "emotion_data_"
    dt_timestamp = dt.datetime.fromtimestamp(time.time()).strftime("%Y_%m_%d_%H_%M_%S")
    plt_file_name = _username + plt_file_name+dt_timestamp+".png"
    plt.savefig(plt_file_name)
    plt.gcf().clear()
    global glob_emo_file
    glob_emo_file = plt_file_name
    return HttpResponse("Success!")

def combined_app(request):
    context = locals()
    from ipware.ip import get_real_ip
    ip_arr = []
    ip_real = get_real_ip(request)
    if ip_real is not None:
        ip_arr.append(ip_real)
    else:
        ip_arr.append('')
    
    from ipware.ip import get_ip
    #ip_arr = []
    ip = get_ip(request)
    if ip is not None:
        ip_arr.append(ip)
    else:
        ip_arr.append('')

    f1 = open("ip.txt", "a")
    for x in ip_arr:
        f1.write(x)
        f1.write('combined app\n')
    f1.close()

    is_logged_in = 0
    if not request.session.get("username") == None:
        #return HttpResponseRedirect('/combined_app/')
        is_logged_in = 1

    template = 'combined_app.html'
    returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username")}
    return render(request, template, returnDict)

def combined_app_live(request):
    context = locals()
    from ipware.ip import get_real_ip
    ip_arr = []
    ip_real = get_real_ip(request)
    if ip_real is not None:
        ip_arr.append(ip_real)
    else:
        ip_arr.append('')
    
    from ipware.ip import get_ip
    #ip_arr = []
    ip = get_ip(request)
    if ip is not None:
        ip_arr.append(ip)
    else:
        ip_arr.append('')

    f1 = open("ip.txt", "a")
    for x in ip_arr:
        f1.write(x)
        f1.write('combined app live\n')
    f1.close()

    is_logged_in = 0
    if not request.session.get("username") == None:
        #return HttpResponseRedirect('/combined_app/')
        is_logged_in = 1

    template = 'combined_app_live.html'
    returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username")}
    return render(request, template, returnDict)

def login_page(request):
    context = locals()
    tried = 0
    #region: store ip details
    from ipware.ip import get_real_ip
    ip_arr = []
    ip_real = get_real_ip(request)
    if ip_real is not None:
        ip_arr.append(ip_real)
    else:
        ip_arr.append('')
    
    from ipware.ip import get_ip
    #ip_arr = []
    ip = get_ip(request)
    if ip is not None:
        ip_arr.append(ip)
    else:
        ip_arr.append('')

    f1 = open("ip.txt", "a")
    for x in ip_arr:
        f1.write(x)
        f1.write('login page.\n')
    f1.close()
    #end region

    #logging logic

    is_logged_in = 0
    if not request.session.get("username") == None:
        #return HttpResponseRedirect('/combined_app/')
        is_logged_in = 1
        return HttpResponseRedirect('/login_combined_app/')

    #region: authenticate login
    #import pdb; pdb.set_trace();
    _username = request.POST.get("username")
    _password = request.POST.get("password")
    _type = request.POST.get("logintype")

    if not _username:
        template = 'login_page.html'
        returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username"), 'error_message':'None', 'logintype':request.session.get('type')}
        return render(request, template, returnDict)

    auth_result = get_authentication(_username, _password, _type)

    if auth_result:
        request.session['logged_in'] = True
        if _type == 'student':
            request.session['username'] = _username
            request.session['id'] = auth_result['student_id']
            request.session['type'] = 'student'
        elif _type == 'teacher':
            request.session['username'] = _username
            request.session['id'] = auth_result['teacher_id']
            request.session['type'] = 'teacher'
        #set other session params
        is_logged_in = 1
        template = 'login_page.html'
        returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username"), 'error_message':'None', 'logintype':request.session.get('type')}
        return render(request, template, returnDict)
    else:
        template = 'login_page.html'
        returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username"), 'error_message':"Wrong Credentials/Non-existent Account",'logintype':request.session.get('type')}
        return render(request, template, returnDict)
        pass

    #endregion
    #import pdb; pdb.set_trace();
    

    template = 'login_page.html'
    returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username")}
    return render(request, template, returnDict)


#region: authentication
def get_authentication(_user, _pass, _t):
    try:
        if _t == 'student':
            s1 = StudentLogin.objects.get(username=_user).__dict__
            if s1['password'] == _pass:
                return s1
            else:
                return None
        elif _t == 'teacher':
            s1 = TeacherLogin.objects.get(username=_user).__dict__
            if s1['password'] == _pass:
                return s1
            else:
                return None
    except:
        return None
#endregion


def log_out(request):
    context = locals()
    request.session.flush()
    #import pdb; pdb.set_trace();
    #region: store ip details
    from ipware.ip import get_real_ip
    ip_arr = []
    ip_real = get_real_ip(request)
    if ip_real is not None:
        ip_arr.append(ip_real)
    else:
        ip_arr.append('')
    
    from ipware.ip import get_ip
    #ip_arr = []
    ip = get_ip(request)
    if ip is not None:
        ip_arr.append(ip)
    else:
        ip_arr.append('')

    f1 = open("ip.txt", "a")
    for x in ip_arr:
        f1.write(x)
        f1.write('logout page.\n')
    f1.close()
    #end region

    template = 'logged_out.html'
    return render(request, template, context)

def login_combined_app(request):
    context = locals()
    from ipware.ip import get_real_ip
    ip_arr = []
    ip_real = get_real_ip(request)
    if ip_real is not None:
        ip_arr.append(ip_real)
    else:
        ip_arr.append('')
    
    from ipware.ip import get_ip
    #ip_arr = []
    ip = get_ip(request)
    if ip is not None:
        ip_arr.append(ip)
    else:
        ip_arr.append('')

    f1 = open("ip.txt", "a")
    for x in ip_arr:
        f1.write(x)
        f1.write('combined app\n')
    f1.close()

    is_logged_in = 0
    if not request.session.get("username") == None:
        #return HttpResponseRedirect('/combined_app/')
        is_logged_in = 1

    template = 'login_combined_app_test.html'
    returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username")}
    return render(request, template, returnDict)

def login_combined_app_test(request):
    context = locals()
    from ipware.ip import get_real_ip
    ip_arr = []
    ip_real = get_real_ip(request)
    if ip_real is not None:
        ip_arr.append(ip_real)
    else:
        ip_arr.append('')
    
    from ipware.ip import get_ip
    #ip_arr = []
    ip = get_ip(request)
    if ip is not None:
        ip_arr.append(ip)
    else:
        ip_arr.append('')

    f1 = open("ip.txt", "a")
    for x in ip_arr:
        f1.write(x)
        f1.write('combined app\n')
    f1.close()

    is_logged_in = 0
    if not request.session.get("username") == None:
        #return HttpResponseRedirect('/combined_app/')
        is_logged_in = 1

    template = 'login_combined_app_test.html'
    returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username")}
    return render(request, template, returnDict)

#start chatframe
def chatframe(request):
    context = locals()
    from ipware.ip import get_real_ip
    ip_arr = []
    ip_real = get_real_ip(request)
    if ip_real is not None:
        ip_arr.append(ip_real)
    else:
        ip_arr.append('')
    
    from ipware.ip import get_ip
    #ip_arr = []
    ip = get_ip(request)
    if ip is not None:
        ip_arr.append(ip)
    else:
        ip_arr.append('')

    f1 = open("ip.txt", "a")
    for x in ip_arr:
        f1.write(x)
        f1.write('combined app\n')
    f1.close()

    is_logged_in = 0
    _username = request.session.get("username")
    if not _username == None:
        #return HttpResponseRedirect('/combined_app/')
        is_logged_in = 1

    if is_logged_in == 1:
        pass

    template = 'chatframe.html'
    returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username")}
    return render(request, template, returnDict)
#end chatframe

def register_page(request):
    context = locals()
    #region: store ip details
    from ipware.ip import get_real_ip
    ip_arr = []
    ip_real = get_real_ip(request)
    if ip_real is not None:
        ip_arr.append(ip_real)
    else:
        ip_arr.append('')
    
    from ipware.ip import get_ip
    #ip_arr = []
    ip = get_ip(request)
    if ip is not None:
        ip_arr.append(ip)
    else:
        ip_arr.append('')

    f1 = open("ip.txt", "a")
    for x in ip_arr:
        f1.write(x)
        f1.write('register page.\n')
    f1.close()
    #end region

    #logging logic
    #import pdb; pdb.set_trace()

    is_logged_in = 0
    if request.session.get("logged_in") == True:
        #return HttpResponseRedirect('/combined_app/')
        is_logged_in = 1
        is_registered = 0
        template = 'register_page.html'
        returnDict = {'is_logged_in':is_logged_in, 'is_registered':is_registered, 'username':request.session.get("username")}
        return render(request, template, returnDict)

    
    if request.POST.get('username') == None:
        is_registered = 0
        is_logged_in = 0

        ent_array = EntityTable.objects.filter(section=None).values()
        sd_array = SchoolDetails.objects.all().values()
        
        template = 'register_page.html'
        returnDict = {'is_logged_in':is_logged_in, 'is_registered':is_registered, 'username':request.session.get("username"), 'error_message':'None','logintype':request.session.get('type'), 'sd_a':sd_array, 'ent_a':ent_array}
        return render(request, template, returnDict)            

    #import pdb; pdb.set_trace();
    reg_auth_result = get_reg_authentication(request)

    if reg_auth_result['success'] == True:
        #set other session params
        is_logged_in = 0
        is_registered = 1
        template = 'register_page.html'
        returnDict = {'is_logged_in':is_logged_in, 'is_registered':is_registered,'username':request.session.get("username"), 'error_message':'None', 'logintype':request.session.get('type')}
        return render(request, template, returnDict)
    else:
        is_registered = 2
        is_logged_in = 0
        template = 'register_page.html'
        msg = reg_auth_result['msg']
        ent_array = EntityTable.objects.filter(section=None).values()
        sd_array = SchoolDetails.objects.all().values()
        returnDict = {'is_logged_in':is_logged_in, 'is_registered':is_registered, 'username':request.session.get("username"), 'error_message':msg,'logintype':request.session.get('type'), 'sd_a':sd_array, 'ent_a':ent_array}
        return render(request, template, returnDict)
        pass

    #endregion
    #import pdb; pdb.set_trace();
    

    template = 'register_page.html'
    returnDict = {'is_logged_in':is_logged_in, 'username':request.session.get("username"), 'is_registered':is_registered, 'error_message':'None'}
    return render(request, template, returnDict)
#end register page

#start region get reg authentication
def get_reg_authentication(request):
    _username = request.POST.get("username")
    _password = request.POST.get("password")
    _re_password = request.POST.get("re_password")
    _fn = request.POST.get("first_name")
    _mn = request.POST.get("middle_name")
    _ln = request.POST.get("last_name")
    #import pdb; pdb.set_trace()
    _school = int(request.POST.get("school"))
    _email = request.POST.get("email_id")
    _phone = request.POST.get("phone")
    _class = int(request.POST.get("Class"))
    _type = request.POST.get("logintype")

    try:
        if _type == 'student':
            #s1 = StudentLogin.objects.get(username=_user).__dict__
            if StudentLogin.objects.filter(username=_username).exists():
                return {'success':None, 'msg':"Username Exists"}
            if not _password == _re_password:
                return {'success':None, 'msg':"Password not matching"}
            if StudentDetail.objects.filter(email=_email).exists():
                return {'success':None, 'msg':"Email exists"}
            if StudentDetail.objects.filter(phone=_phone).exists():
                return {'success':None, 'msg':"Phone number already in use"}
            
            sl_entry = StudentLogin(username=_username,password=_password)
            sl_entry.save()
            sl_d = StudentLogin.objects.get(username=_username)
            #sl_d_id = int(sl_d['student_id'])
            school_obj = SchoolDetails.objects.get(school_id = _school)
            entity_obj = EntityTable.objects.get(entity_id = _class)
            
            sd_entry = StudentDetail(student=sl_d, first_name = _fn, middle_name = _mn, last_name = _ln, school = school_obj, entity = entity_obj, email=_email, phone=_phone)
            sd_entry.save()
            return {'success':True, 'msg':""}
                
        elif _type == 'teacher':
            #s1 = TeacherLogin.objects.get(username=_user).__dict__
            if TeacherLogin.objects.get(username=_username).exists():
                return {'success':None, 'msg':"Username Exists"}
            if not _password == _re_password:
                return {'success':None, 'msg':"Password not matching"}
            if TeacherDetail.objects.filter(email=_email).exists():
                return {'success':None, 'msg':"Email exists"}
            if TeacherDetail.objects.filter(phone=_phone).exists():
                return {'success':None, 'msg':"Phone number already in use"}

            tl_entry = TeacherLogin(username=_username,password=_password)
            tl_entry.save()
            tl_d = TeacherLogin.objects.get(username=_username)
            #tl_d_id = tl_d['student_id']
            school_obj = SchoolDetails.objects.get(school_id = _school)
            td_entry = TeacherDetail(teacher=tl_d, first_name = _fn, middle_name = _mn, last_name = _ln, school = school_obj, email=_email, phone=_phone)
            td_entry.save()
            return {'success':True, 'msg':''}
    except:
        return {'success':None, 'msg':"Query failure."}
    return {'success':None, 'msg':"Some Network Error."}
    
#end region get reg authentication

