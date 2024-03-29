if [ ! -d "./logs" ]; then
    mkdir ./logs
fi
if [ ! -d "./backtest" ]; then
    mkdir ./backtest
fi
universe=csi300
online_lr=0.000005
only_backtest=true
sed -i "s/csi300\|csi500/$universe/g" workflow_config_master_Alpha158.yaml
if $only_backtest; then
    nohup python -u main.py --universe $universe --online_lr $online_lr --only_backtest > ./backtest/${universe}online_lr${online_lr}.log 2>&1 &
else
    nohup python -u main.py --universe $universe --online_lr $online_lr > ./logs/${universe}online_lr${online_lr}.log 2>&1 &
fi
echo $!