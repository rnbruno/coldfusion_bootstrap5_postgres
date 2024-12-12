
  document.getElementById('customersLink').addEventListener('click', function(event) {
    // Evita o comportamento padrão do link
    event.preventDefault();
    
    // Redireciona para outra página (exemplo: customers.html)
    window.location.href = 'customers.html'; // ou qualquer URL que você queira
  });
