"""emotion_detector URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from django.contrib.auth import views as auth_views
from test_app import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.home, name='home'),
    url(r'^eye_gaze_tracker/', views.eye_gaze_tracker, name='eye_gaze_tracker'),
    url(r'^emotion_detector/', views.emotion_detector, name='emotion_detector'),
    url(r'^get_attention_data/', views.get_attention_data, name='get_attention_data'),
    url(r'^get_emotion_data/',views.get_emotion_data, name='get_emotion_data'),
    url(r'^combined_app/', views.combined_app, name='combined_app'),
    url(r'^combined_app_live/', views.combined_app_live, name='combined_app_live'),
    url(r'^login_page/', views.login_page, name='login_page'),
    url(r'^log_out/', views.log_out, name='log_out'),
    url(r'^login_combined_app/', views.login_combined_app, name='login_combined_app'),
    url(r'^login_combined_app_test/', views.login_combined_app_test, name='login_combined_app_test'),
    url(r'^chatframe/', views.chatframe, name='chatframe'),
    url(r'^register_page/', views.register_page, name='register_page'),
    url(r'^teacher_profile_info/', views.teacher_profile_info, name='teacher_profile_info'),
    url(r'^update_teacher_info/', views.update_teacher_info, name='update_teacher_info'),
    url(r'^student_profile_info/', views.student_profile_info, name='student_profile_info'),
    url(r'^update_student_info/', views.update_student_info, name='update_student_info'),
    url(r'^teacher_create_lecture/', views.teacher_create_lecture, name='teacher_create_lecture'),
    url(r'^teacher_prev_lectures/', views.teacher_prev_lectures, name='teacher_prev_lectures'),
    url(r'^teacher_new_lectures/', views.teacher_new_lectures, name='teacher_new_lectures'),
    url(r'^student_prev_lectures/', views.student_prev_lectures, name='student_prev_lectures'),
    url(r'^student_new_lectures/', views.student_new_lectures, name='student_new_lectures'),
    url(r'^attend_lecture_student/(?P<lecture_id1>\d+)/', views.attend_lecture_student, name='attend_lecture_student'),
    url(r'^start_lecture_teacher/(?P<lecture_id1>\d+)/', views.start_lecture_teacher, name='start_lecture_teacher'),
]
