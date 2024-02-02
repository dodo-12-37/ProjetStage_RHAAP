BEGIN{FS="|"
printf ("---\njobTemplates_vars:\n");
}
	{ printf("  - name: %s\n",$1);
    printf("    description: \"%s\"\n",$2);
    printf("    job_vars:\n")
    printf("      target_hosts: %s\n",tolower($3)); 
    printf("      user_to_execute_task: %s\n",$4);
    printf("      script_path: %s\n",$5);
    printf("      email_recipients: %s\n",$6);
    printf("      send_email_on_success: \"false\"\n");
    printf("      send_email_on_failure: \"true\"\n");
    printf("    schedules:\n");
    printf("      - name: %s-schedule\n",$1);
    printf("        description: %s\n",$2);
    printf("        starting_hour: '08:00:00'\n");
    printf("        rrules_params:\n");
    printf("          - frequency: 'month'\n");
    printf("            interval: 1\n\n");
  }
