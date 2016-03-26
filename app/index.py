#!/usr/bin/env python
# coding=utf-8

from app import app
from flask import render_template
from flask import request
from .computer import get_student

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/find')
def find():
    return render_template('find.html')


@app.route('/list', methods=['POST'])
def ans():
    if request.method == 'POST':
        student = request.form['no']

        if student.isdigit():
            studentinfo = get_student(student)
            if studentinfo is not None:
                return render_template('ans.html', info=studentinfo['gradelist'], point=studentinfo['pointinfo'])

    return render_template('find.html')


@app.route('/update', methods=['POST'])
def update():
    return render_template('ans.html')
