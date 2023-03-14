from django.shortcuts import render
from django.http import JsonResponse

from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from myapp.serializers import CollectionSerializer
from myapp.models import Collection
# GET Data
@api_view(['GET'])
def all_collection(request):
    all_collection = Collection.objects.filter(status=1).all() #ดึงข้อมูลจาก model Collection
    serializer = CollectionSerializer(all_collection,many=True)
    return Response(serializer.data, status=status.HTTP_200_OK)

# GET Data
@api_view(['GET'])
def detail_collection(request, TID):
    detail_collection = Collection.objects.filter(status=1).get(id = TID) #ดึงข้อมูลจาก model Collection
    serializer = CollectionSerializer(detail_collection,many=False)
    return Response(serializer.data, status=status.HTTP_200_OK)


# POST Data (save data to database)
@api_view(['POST'])
def add_collection(request):
    if request.method == 'POST':
        serializer = CollectionSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_404_NOT_FOUND)

# ใช้ Method PUT เพื่อส่งค่าไป Update ข้อมูล
@api_view(['PUT'])
def update_collection(request, TID):
    collect = Collection.objects.filter(status=1).get(id = TID)
    if request.method == 'PUT':
        data = {}
        serializer = CollectionSerializer(collect, data=request.data)
        if serializer.is_valid():
            serializer.save()
            data['status'] = 'updated'
            return Response(data = data, status = status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_404_NOT_FOUND)


# ใช้ Method DELETE ในการลบข้อมูล ตาม id ที่ส่งมา
@api_view(['PUT'])
def delete_collection(request, TID):
    collect = Collection.objects.filter(status=1).get(id = TID)
    if request.method == 'PUT':
        data = {"status": 0}
        serializer = CollectionSerializer(collect, data)
        if serializer.is_valid():
            serializer.save()
            data['status'] = 'updated'
            return Response(data = data, status = status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_404_NOT_FOUND)
# @api_view(['DELETE'])
# def delete_collection(request,TID):
#   todo = Collection.objects.get(id=TID)

#     if request.method == 'DELETE':
#         delete = todo.delete()
#         data = {}
#         if delete:
#             data ['status'] = 'deleted'
#             statuscode = status.HTTP_200_OK
#         else:
#             data['status'] = 'failed'
#             statuscode = status.HTTP_400_BAD_REQUEST
#         return Response(data=data, status=statuscode)

data = [
    {
        "id" : "1",
        "title" : "What is Computer?",
        "sub_title" : "A computer is a machine that can be programmed to carry out sequences of operations automatically",
        "image_url" : "https://cdn.pixabay.com/photo/2021/12/05/21/39/christmas-balls-6848782_960_720.jpg",
        "detail" : "คอมพิวเตอร์ (อังกฤษ: computer) หรือศัพท์บัญญัติราชบัณฑิตยสภาว่า คณิตกรณ์ เป็นเครื่องจักรแบบสั่งการได้ที่ออกแบบมาเพื่อดำเนินการกับลำดับตัวดำเนินการทางตรรกศาสตร์หรือคณิตศาสตร์ โดยอนุกรมนี้อาจเปลี่ยนแปลงได้เมื่อพร้อม ส่งผลให้คอมพิวเตอร์สามารถแก้ปัญหาได้มากมาย\n\nคอมพิวเตอร์ถูกประดิษฐ์ออกมาให้ประกอบไปด้วยความจำรูปแบบต่าง ๆ เพื่อเก็บข้อมูล อย่างน้อยหนึ่งส่วนที่มีหน้าที่ดำเนินการคำนวณเกี่ยวกับตัวดำเนินการทางตรรกศาสตร์ และตัวดำเนินการทางคณิตศาสตร์ และส่วนควบคุมที่ใช้เปลี่ยนแปลงลำดับของตัวดำเนินการโดยยึดสารสนเทศที่ถูกเก็บไว้เป็นหลัก อุปกรณ์เหล่านี้จะยอมให้นำเข้าข้อมูลจากแหล่งภายนอก และส่งผลจากการคำนวณตัวดำเนินการออกไป"
    },
    {
        "id" : "2",
        "title" : "What is Programmer?",
        "sub_title" : "B computer is a machine that can be programmed to carry out sequences of operations automatically",
        "image_url" : "https://cdn.pixabay.com/photo/2017/12/11/18/13/christmas-3012862_960_720.jpg",
        "detail" : "นักเขียนโปรแกรม หรือ โปรแกรมเมอร์ (อังกฤษ: programmer) มีหน้าที่หลักคือการเขียนโปรแกรมคอมพิวเตอร์ ซึ่งนักเขียนโปรแกรมสามารถหมายถึงผู้ที่เชี่ยวชาญในการโปรแกรมเฉพาะด้าน หรือผู้ที่สามารถเขียนรหัสซอฟต์แวร์ได้หลากหลายข้อมูล\n\nเอดา ไบรอนได้ชื่อว่าเป็นนักเขียนโปรแกรมคนแรกของโลก เพราะเป็นคนแรกที่สามารถนำขั้นตอนวิธี มาเรียบเรียงเป็นชุดคำสั่ง ให้แก่เครื่องคำนวณได้ในปี พ.ศ. 2385 (ค.ศ. 1842) ในยุคที่ยังไม่มีเครื่องคอมพิวเตอร์"
    },
    {
        "id" : "3",
        "title" : "What is Software?",
        "sub_title" : "C computer is a machine that can be programmed to carry out sequences of operations automatically",
        "image_url" : "https://cdn.pixabay.com/photo/2021/11/17/13/48/star-6803666_960_720.jpg",
        "detail" : "ซอฟต์แวร์ (อังกฤษ: software) หรือ ส่วนชุดคำสั่ง คือ ส่วนหนึ่งของระบบคอมพิวเตอร์ที่ใช้ในการจัดเก็บและประมวลผลข้อมูล เป็นชุดคำสั่งที่บอกวิธีการทำงานของคอมพิวเตอร์ ซึ่งตรงกันข้ามกับฮาร์ดแวร์ที่เป็นระบบคอมพิวเตอร์ที่สามารถจับต้องได้ ในสาขาวิชาวิทยาการคอมพิวเตอร์และวิศวกรรมซอฟต์แวร์นั้น ซอฟต์แวร์คอมพิวเตอร์ คือ ข้อมูลทั้งหมดที่ได้รับการประมวลผลโดยระบบคอมพิวเตอร์ และ โปรแกรมคอมพิวเตอร์ ซอฟต์แวร์คอมพิวเตอร์นั้นประกอบด้วย โปรแกรมคอมพิวเตอร์, ไลบรารี และ ข้อมูลที่ไม่สามารถเรียกใช้งานได้ด้วยโปรแกรมคอมพิวเตอร์ อาทิ เอกสารออนไลน์หรือสื่อดิจิทัล คอมพิวเตอร์เครื่องหนึ่งจำเป็นต้องมีทั้งฮาร์ดแวร์และซอฟต์แวร์ และหากขาดอย่างใดอย่างหนึ่งไป จะไม่สามารถใช้งานระบบคอมพิวเตอร์ได้"
    },
    {
        "id" : "4",
        "title" : "What is Software Engineering?",
        "sub_title" : "D computer is a machine that can be programmed to carry out sequences of operations automatically",
        "image_url" : "https://cdn.pixabay.com/photo/2020/11/16/16/17/fallow-deer-5749428_960_720.jpg",
        "detail" : "วิศวกรรมซอฟต์แวร์ คือ การประยุกต์ใช้ระบบ กฎเกณฑ์ การเข้าถึงซึ่งสามารถวัดประเมินได้ในการพัฒนา การปฏิบัติการ และการบำรุงรักษาซอฟต์แวร์ และในการศึกษาสิ่งเหล่านี้ ก็คือการประยุกต์ใช้งานทางด้านวิศวกรรมมาจัดการกับซอฟต์แวร์ มหาวิทยาลัยในประเทศไทยที่เปิดสอนหลักสูตรวิศวกรรมซอฟต์แวร์เป็นแห่งแรก คือ ภาควิชาวิศวกรรมคอมพิวเตอร์ คณะวิศวกรรมศาสตร์ จุฬาลงกรณ์มหาวิทยาลัย\n\nข้อตกลงทางวิศวกรรมซอฟต์แวร์ ปรากฏขึ้นครั้งแรกในการประชุมวิศวกรรมซอฟต์แวร์นาโต ที่จัดขึ้นในปี ค.ศ. 1968 และได้ให้ความสำคัญกับเหตุการณ์ วิกฤติการณ์ซอฟต์แวร์ ในขณะนั้น ตั้งแต่นั้นเป็นต้นมา วิศวกรรมซอฟต์แวร์ก็ได้กลายมาเป็นศาสตร์และแขนงของการศึกษาเฉพาะ ในการสร้างซอฟต์แวร์ที่มีคุณภาพสูงขึ้น มีราคาถูกลงเป็นที่ยอมรับได้ ดูแลรักษาได้ง่าย และพัฒนาได้อย่างรวดเร็วขึ้น ตั้งแต่นั้นก็ยังคงมีการเปรียบเทียบวิศวกรรมซอฟต์แวร์กับวิศวกรรมแขนงอื่น ยังคงมีการถกเถียงกันว่าวิศวกรรมซอฟต์แวร์ที่แท้จริงคืออะไร และวิศวกรรมซอฟต์แวร์สมควรเป็นหนึ่งในสาขาวิศวกรรมหรือไม่ วิศวกรรมซอฟต์แวร์ได้ขยายวงกว้างอย่างไร้ขีดจำกัดไปยังผู้ที่มีส่วนเกี่ยวข้องกับซอฟต์แวร์ เช่น โปรแกรมเมอร์ การพัฒนาซอฟต์แวร์ในบางครั้งข้อตกลงอาจขึ้นอยู่กับผู้ที่มีส่วนสำคัญในอุตสาหกรรมซอฟต์แวร์ในการเปลี่ยนแปลงกระบวนการสร้างซอฟต์แวร์ แต่กระนั้นวิศวกรรมซอฟต์แวร์ก็ยังเป็นที่ใฝ่ฝันของวัยรุ่นในการประกอบอาชีพ ในนิตยสาร Money Magazine ได้กล่าวว่า อาชีพในแขนงวิศวกรรมซอฟต์แวร์มีแนวโน้มอนาคตที่สดใส และในเว็บไซต์ Salary.com ได้กล่าวว่าอัตราเงินเดือนในอาชีพวิศวกรรมซอฟต์แวร์มีอัตราสูงที่สุดในสหรัฐในปี ค.ศ. 2006"
    }
]

# Create your views here.
def Home(request):
    return JsonResponse(data=data, safe=False, json_dumps_params={'ensure_ascii': False} )