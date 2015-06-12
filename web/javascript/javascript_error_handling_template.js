// HOW TO STRUCTURE ERROR HANDLING
// IN JAVASCRIPT.

try
{
	// Run some code here, which may or may
	// not work.

	// This statement will "throw" the error
	// to be caught in the error handler.
	// Catch only runs if an exception
	// is thrown.
	if(ERRORCONDITION)
	{
		throw ERRORVALUE
	}
}
// Use "error" here; it's a keyword.
catch(error)
{
	// Handle errors here.
	// Catch and suppress errors.

	// The value of the "throw"
	// is "caught" here and stored
	// in the "error" argument.

	// "error" can also be an object
	// of which the member "message"
	// contains the error message.
}
finally
{
	// Code here will ALWAYS be executed
	// regardless of whether or not an error
	// occurred.
}
