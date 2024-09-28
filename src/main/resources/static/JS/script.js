        // Event listener for the select tag
        document.getElementById('PaymentMethod').addEventListener('change', function() {
            if (this.value === 'Online_Payment') {
                // Show the modal when the 'showModal' option is selected
                var myModal = new bootstrap.Modal(document.getElementById('PaymentMethod'));
                myModal.show();
            }
        });
