# Micrium OS


```
/* Definition of the Task Control Blocks for three tasks */
static  OS_TCB        START_TSK_TCB;

/* Definition of the Stacks for three tasks */
static  CPU_STK_SIZE  START_TSK_STACK[START_TASK_STK_SIZE];;

/* Task functions */
static void StartTask ( void   *p_arg );
```

## main()
```
OSTaskCreate(
				(OS_TCB     *)&START_TSK_TCB,               /* Create the start task                                */
				(CPU_CHAR   *)"Start Task",
				(OS_TASK_PTR ) StartTask,
				(void       *) 0,
				(OS_PRIO     ) START_TASK_PRIO,
				(CPU_STK    *) START_TSK_STACK,
				(CPU_STK     )(START_TASK_STK_SIZE / 10u),
				(CPU_STK_SIZE) START_TASK_STK_SIZE,
				(OS_MSG_QTY  ) 0,
				(OS_TICK     ) 0,
				(void       *) 0,
				(OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
				(OS_ERR     *)&err
		);


	OSStart(&err);      /* Start multitasking (i.e. give control to uC/OS-III). */
    while(DEF_ON){			/* Should Never Get Here	*/
    };
```



```
static  void  StartTask(void *p_arg)
{
	
		OS_ERR  err;

	
		BSP_OS_TickEnable(); /* Enable the tick timer and interrupt                  */
		LED_init(); 
		LCD_Initialization();
		BUTTON_init();

	
		//Clear the display in blue
		LCD_Clear(Red);
	
		OSTaskCreate(
				(OS_TCB     *)&LCD_TSK_TCB,               /* Create the start task                                */
				(CPU_CHAR   *)"LCD Task",
				(OS_TASK_PTR ) LcdTask,
				(void       *) 0,
				(OS_PRIO     ) LCD_TASK_PRIO,
				(CPU_STK    *) LCD_TSK_STACK,
				(CPU_STK     )(LCD_TASK_STK_SIZE / 10u),
				(CPU_STK_SIZE) LCD_TASK_STK_SIZE,
				(OS_MSG_QTY  ) 0,
				(OS_TICK     ) 0,
				(void       *) 0,
				(OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
				(OS_ERR     *)&err
		);
				
		OSTaskCreate(
				(OS_TCB     *)&LED_TSK_TCB,               /* Create the start task                                */
				(CPU_CHAR   *)"LED Task",
				(OS_TASK_PTR ) LedTask,
				(void       *) 0,
				(OS_PRIO     ) LED_TASK_PRIO,
				(CPU_STK    *) LED_TSK_STACK,
				(CPU_STK     )(LED_TASK_STK_SIZE / 10u),
				(CPU_STK_SIZE) LED_TASK_STK_SIZE,
				(OS_MSG_QTY  ) 0,
				(OS_TICK     ) 0,
				(void       *) 0,
				(OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
				(OS_ERR     *)&err
		);

    OSSchedRoundRobinCfg(DEF_ENABLE, 10, &err); 

}
```
