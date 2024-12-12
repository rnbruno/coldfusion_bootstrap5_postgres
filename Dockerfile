FROM adobecoldfusion/coldfusion:2018

# Configure a senha do administrador do ColdFusion
ENV cfconfig_adminPassword=admin_password_here

# Exponha a porta padrão do ColdFusion
EXPOSE 8500
