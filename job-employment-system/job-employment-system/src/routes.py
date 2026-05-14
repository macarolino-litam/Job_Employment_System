from flask import render_template, request, redirect
from db import get_connection

def init_routes(app):

    # =========================
    # HOME PAGE
    # =========================

    @app.route('/')
    def index():
        return render_template('index.html')

    # =====================================================
    # APPLICANTS
    # =====================================================

    @app.route('/applicants')
    @app.route('/applicants/<int:id>')
    def applicants(id=None):

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM applicants")
        data = cursor.fetchall()

        applicant = None

        if id:
            cursor.execute(
                "SELECT * FROM applicants WHERE applicant_id=%s",
                (id,)
            )

            applicant = cursor.fetchone()

        return render_template(
            'applicants.html',
            data=data,
            applicant=applicant
        )

    # ADD APPLICANT
    @app.route('/add_applicant', methods=['POST'])
    def add_applicant():

        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            INSERT INTO applicants
            (name, email, phone)
            VALUES (%s, %s, %s)
        """, (name, email, phone))

        conn.commit()

        return redirect('/applicants')

    # UPDATE APPLICANT
    @app.route('/update_applicant/<int:id>', methods=['POST'])
    def update_applicant(id):

        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            UPDATE applicants
            SET
                name=%s,
                email=%s,
                phone=%s
            WHERE applicant_id=%s
        """, (name, email, phone, id))

        conn.commit()

        return redirect('/applicants')

    # DELETE APPLICANT
    @app.route('/delete_applicant/<int:id>')
    def delete_applicant(id):

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute(
            "DELETE FROM applicants WHERE applicant_id=%s",
            (id,)
        )

        conn.commit()

        return redirect('/applicants')

    # =====================================================
    # JOBS
    # =====================================================

    @app.route('/jobs')
    @app.route('/jobs/<int:id>')
    def jobs(id=None):

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM jobs")
        data = cursor.fetchall()

        job = None

        if id:
            cursor.execute(
                "SELECT * FROM jobs WHERE job_id=%s",
                (id,)
            )

            job = cursor.fetchone()

        return render_template(
            'jobs.html',
            data=data,
            job=job
        )

    # ADD JOB
    @app.route('/add_job', methods=['POST'])
    def add_job():

        job_title = request.form['job_title']
        company = request.form['company']
        salary = request.form['salary']

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            INSERT INTO jobs
            (job_title, company, salary)
            VALUES (%s, %s, %s)
        """, (job_title, company, salary))

        conn.commit()

        return redirect('/jobs')

    # UPDATE JOB
    @app.route('/update_job/<int:id>', methods=['POST'])
    def update_job(id):

        job_title = request.form['job_title']
        company = request.form['company']
        salary = request.form['salary']

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            UPDATE jobs
            SET
                job_title=%s,
                company=%s,
                salary=%s
            WHERE job_id=%s
        """, (job_title, company, salary, id))

        conn.commit()

        return redirect('/jobs')

    # DELETE JOB
    @app.route('/delete_job/<int:id>')
    def delete_job(id):

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute(
            "DELETE FROM jobs WHERE job_id=%s",
            (id,)
        )

        conn.commit()

        return redirect('/jobs')

    # =====================================================
    # APPLICATIONS
    # =====================================================

    @app.route('/applications')
    @app.route('/applications/<int:id>')
    def applications(id=None):

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            SELECT
                application_id,
                applicant_id,
                job_id,
                status
            FROM applications
        """)

        data = cursor.fetchall()

        application = None

        if id:
            cursor.execute("""
                SELECT
                    application_id,
                    applicant_id,
                    job_id,
                    status
                FROM applications
                WHERE application_id=%s
            """, (id,))

            application = cursor.fetchone()

        return render_template(
            'applications.html',
            data=data,
            application=application
        )

    # ADD APPLICATION
    @app.route('/add_application', methods=['POST'])
    def add_application():

        applicant_id = request.form['applicant_id']
        job_id = request.form['job_id']
        status = request.form['status']

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            INSERT INTO applications
            (applicant_id, job_id, status)
            VALUES (%s, %s, %s)
        """, (applicant_id, job_id, status))

        conn.commit()

        return redirect('/applications')

    # UPDATE APPLICATION
    @app.route('/update_application/<int:id>', methods=['POST'])
    def update_application(id):

        applicant_id = request.form['applicant_id']
        job_id = request.form['job_id']
        status = request.form['status']

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            UPDATE applications
            SET
                applicant_id=%s,
                job_id=%s,
                status=%s
            WHERE application_id=%s
        """, (applicant_id, job_id, status, id))

        conn.commit()

        return redirect('/applications')

    # DELETE APPLICATION
    @app.route('/delete_application/<int:id>')
    def delete_application(id):

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute(
            "DELETE FROM applications WHERE application_id=%s",
            (id,)
        )

        conn.commit()

        return redirect('/applications')