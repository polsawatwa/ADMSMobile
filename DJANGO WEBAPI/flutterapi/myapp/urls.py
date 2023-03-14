from django.urls import path
from .views import *

urlpatterns = [
    # อยากให้ Homepage แสดงอะไร
    # ใช้วิธีการ JsonResponse
    path ('', Home),
    path ('api/user/', user),
    path ('api/all-collection/', all_collection),
    path ('api/detail-collection/<int:TID>', detail_collection),
    path ('api/add-collection/', add_collection),
    path ('api/update-collection/<int:TID>', update_collection),
    path ('api/delete-collection/<int:TID>', delete_collection),

]